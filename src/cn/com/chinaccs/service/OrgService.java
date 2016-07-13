package cn.com.chinaccs.service;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import cn.com.chinaccs.bean.CHResponse;
import cn.com.chinaccs.bean.TreeProp;
import cn.com.chinaccs.bean.entity.TNOrg;
import cn.com.chinaccs.dao.impl.OrgDao;
import cn.com.chinaccs.helper.TreeHelper;
import cn.com.chinaccs.utils.StringUtil;

public class OrgService extends BaseService {
	
	/**
	 * 添加组织机构
	 * @author YB
	 * */
	public CHResponse save(TNOrg org) {
		CHResponse chResponse = new CHResponse();
		if(null != org) {
			String id = "org"+StringUtil.createSerialNum();
			OrgDao dao = new OrgDao();
			TNOrg pOrg = new TNOrg();
			String pId = org.getParentId();
			pOrg = dao.find(pId);
			
			int seqNum = dao.querySeqNum(pId,org.getType());
			org.setSeqNum(seqNum);//赋排序 分类排序
			org.setId(id);//赋Id
			
			if (pOrg != null && pOrg.getOrgLevel() != null) {
				if(TNOrg.ORG_TYPE_DEPARTMENT.equals(pOrg.getType())){
					chResponse.setMsg("添加失败，上层机构为部门不可扩展!");
					return chResponse;
				}
				String orgSeq = pOrg.getOrgSeq()+"."+id;
				org.setOrgLevel(pOrg.getOrgLevel() + 1); // 赋树形等级
				org.setOrgSeq(orgSeq);//层级序号
				org.setOrgSeqName(pOrg.getOrgName()+">>"+org.getOrgName());//别名
			} else {
				org.setOrgLevel(1); // 赋树形等级
				org.setOrgSeq(id);//层级序号
				org.setOrgSeqName(org.getOrgName());//别名
			}
			
			if(TNOrg.ORG_TYPE_DEPARTMENT.equals(org.getType())){//部门赋机构代码  = 父类代码+“_”+部门序号
				String orgCode = "";
			//	String orgName = org.getOrgName();
			//	String pinyinHead = StringUtil.getPinYinHeadChar(orgName);//首字母
				if(seqNum>=10)//目前只考虑部门级 在01-99范围内
					orgCode=pOrg.getOrgCode() +"_"+ String.valueOf(seqNum);
				else
					orgCode=pOrg.getOrgCode() +"_"+"0"+ String.valueOf(seqNum);
				org.setOrgCode(orgCode);
				org.setIsExtend("false");//部门不可扩展
			}else{
				org.setIsExtend("true");//机构可扩展
			}
			Serializable  bid = dao.save(org);
			if(null != bid) {
				chResponse.setResult(OP_SUCCESS);
				chResponse.setMsg("组织机构添加成功");
				chResponse.setData(id.toString());
			}
			dao = null;
		}
		return chResponse;
	}
	
	/**
	 * 更新组织机构
	 * @author YB
	 * */
	public CHResponse upd(TNOrg org) {
		CHResponse chResponse = new CHResponse();
		if(null != org) {
			OrgDao dao = new OrgDao();
			TNOrg oldOrg = new TNOrg();
			String orgId = org.getId();
			oldOrg = dao.find(orgId);
			String newName = org.getOrgName();
			String newCode = org.getOrgCode();
			String oldName = oldOrg.getOrgName();
			String oldCode = oldOrg.getOrgCode();
			String nameSql = "";
			String codeSql = "";
			if(org.getOrgName()!=null){
				if(!oldName.equals(newName)){
					oldOrg.setOrgName(newName);
					nameSql = "update t_n_org t set t.org_seq_name = replace( t.org_seq_name,'"+oldName+"', '"+newName+"') where t.parent_id='"+orgId+"' or t.id='"+orgId+"' and t.org_seq_name like '%"+oldName+"%'";
				}
			}
			if(org.getOrgContact()!=null)
				oldOrg.setOrgContact(org.getOrgContact());
			if(org.getOrgTel()!=null)
				oldOrg.setOrgTel(org.getOrgTel());
			if(!TNOrg.ORG_TYPE_DEPARTMENT.equals(oldOrg.getType())){
				if(org.getOrgCode()!=null){
					if(!oldCode.equals(newCode)){
						oldOrg.setOrgCode(org.getOrgCode());
						codeSql = "update t_n_org t set t.org_code = replace( t.org_code,'"+oldCode+"_', '"+newCode+"_') where t.parent_id='"+orgId+"'  and t.org_code like '%"+oldCode+"_%'";
					}
				}
			}
			if(dao.update(oldOrg)){
				if(!"".equals(nameSql))
					dao.executeSql(nameSql);
				if(!"".equals(codeSql))
					dao.executeSql(codeSql);
				chResponse.setResult(OP_SUCCESS);
				chResponse.setMsg("组织机构修改成功");
			}
			dao = null;
		}
		
		return chResponse;
	}
	
/**
 * 删除且限制
 * */
	public CHResponse del(String id) {
		CHResponse chResponse = new CHResponse();
		chResponse.setResult(OP_FAIL);
		chResponse.setMsg("数据删除失败");
		OrgDao dao = new OrgDao();
		String sql = "select * from t_n_role t where t.org_id = '"+id+"'";
		List<Object> objList = dao.queryObjSql(sql);
		if(objList!=null&&objList.size()>0){
			chResponse.setMsg("删除失败，必须先删除相关联的角色！");
			dao = null;
			return chResponse;
		}
		if(dao.delete(id)) {
			chResponse.setResult(OP_SUCCESS);
			chResponse.setMsg("数据删除成功");
		}
		dao = null;
		return chResponse;
	}
	
	/**
	 * 获取组织机构树  zTree
	 * @param orgId
	 * @param orgName
	 * @author YB
	 * @param flag 
	 * @param user_orgId 
	 * */
	public CHResponse getzTree(String queryOrgId,String queryOrgName, String userOrgId) {
		CHResponse chResponse = new CHResponse();
		chResponse.setResult(OP_FAIL);
		chResponse.setMsg("组织机构树获取失败");
		queryOrgName = queryOrgName ==null?"":queryOrgName;
		OrgDao dao = new OrgDao();
		List<Object> list = dao.getZnodes(queryOrgId,queryOrgName,userOrgId);	
		if(list.size()>0){
			String dataStr = initZnodes(list);
			chResponse.setResult(OP_SUCCESS);
			chResponse.setMsg("获取成功！");
			chResponse.setData(dataStr);
		}

		return chResponse;
	}
	
	
	/**
	 * 拼接组织机构树json
	 * @author YB
	 * @param flag 
	 * */
	public String initZnodes(List<Object> list) {
		String str ="[";
		for(Object obj : list){
			str +="{\"id\":\""+((Object[])obj)[0].toString()+"\",\"pId\":\""+((Object[])obj)[1].toString()+"\",\"name\":\""+((Object[])obj)[2].toString()+"\",\"isParent\":\""+((Object[])obj)[3].toString()+"\"";
			if( "true".equals(((Object[])obj)[3].toString())){
				str +=",\"nocheck\":\"true\",\"type\":\""+((Object[])obj)[4].toString()+"\"";
			}else{
				str +=",\"iconSkin\":\"orgicon\",\"type\":\""+((Object[])obj)[4].toString()+"\"";
			}
			str +="},";
		} 
		str = str.substring(0,str.length()-1)+"]";
		System.out.println(str);
		return str;
	}
	
	
	/**
	 * author: xiaoliping 
	 * descr: 表单中获取组织机构下拉树
	 */
	public CHResponse getFormzTree(String queryOrgId,String queryOrgName,String flag,String userOrgId) {
		CHResponse chResponse = new CHResponse();
		chResponse.setResult(OP_FAIL);
		chResponse.setMsg("组织机构树获取失败");
		queryOrgName = queryOrgName ==null?"":queryOrgName;
		OrgDao dao = new OrgDao();
		List<Object> list = null;
		if(flag!=null && flag.equals("lowerQuery"))
			list = dao.getLowerFormZnodes(queryOrgId,queryOrgName,userOrgId);
		else
			list = dao.getAllFormZnodes(queryOrgId,queryOrgName);
		if(list.size()>0){
			String dataStr = initFormZnodes(list);
			chResponse.setResult(OP_SUCCESS);
			chResponse.setMsg("获取成功！");
			chResponse.setData(dataStr);
		}

		return chResponse;
	}
	
	
	/**
	 * author: xiaoliping 
	 * descr: 表单中拼接组织机构下拉树
	 */
	public String initFormZnodes(List<Object> list) {
		String str ="[";
		for(Object obj : list){
			str +="{\"id\":\""+((Object[])obj)[0].toString()+"\",\"pId\":\""+((Object[])obj)[1].toString()+"\",\"name\":\""+((Object[])obj)[2].toString()+"\",\"isParent\":\""+((Object[])obj)[3].toString()+"\"";
			if( "true".equals(((Object[])obj)[3].toString())){
				str +=",\"type\":\""+((Object[])obj)[4].toString()+"\"";
			}else{
				str +=",\"iconSkin\":\"orgicon\",\"type\":\""+((Object[])obj)[4].toString()+"\"";
			}
			str +="},";
		} 
		str = str.substring(0,str.length()-1)+"]";
		System.out.println(str);
		return str;
	}
	

	/**
	 * 获取组织机构树
	 * @param orgId
	 * @return
	 */
	public CHResponse getSubTree(String orgId) {
		CHResponse chResponse = new CHResponse();
		chResponse.setResult(OP_FAIL);
		chResponse.setMsg("组织机构树获取失败");
		if(!StringUtil.isEmpty(orgId)) {
			OrgDao orgDao = new OrgDao();
			List<TNOrg> orgs =  orgDao.findAll();
			chResponse = handleTree(orgs,orgId);
			orgs = null;
			orgDao = null;
		}
		return chResponse;
	}
	
	
	/**
	 * 获取机构信息（不包含部门信息）
	 * @param orgId
	 * @return
	 */
	public CHResponse getOrgSubTree(String orgId) {
		CHResponse chResponse = new CHResponse();
		chResponse.setMsg("组织机构树获取失败");
		if(!StringUtil.isEmpty(orgId)) {
			OrgDao orgDao = new OrgDao();
			List<TNOrg> orgs =  orgDao.getOrgs();
			chResponse = handleTree(orgs,orgId);
			orgs = null;
			orgDao = null;
		}
	    return chResponse;
	}
	
	/**
	 * 获取机构信息（非部门信息）
	 * @param orgId
	 * @return
	 */
	public CHResponse getOrgInfo(String orgId) {
		CHResponse chResponse = new CHResponse();
		if(!StringUtil.isEmpty(orgId)) {
			OrgDao orgDao = new OrgDao();
			TNOrg org = null;
			while(org == null || !TNOrg.ORG_TYPE_ORG.equals(org.getType())) {
				if(null == org) {
				   org = orgDao.find(orgId);
				} else {
					org = orgDao.find(org.getParentId());
				}
			}
			chResponse.setData(org);
			chResponse.setResult(OP_SUCCESS);
			chResponse.setMsg(OP_SUCCESS_MSG);
			orgDao = null;
			org = null;
		}
		return chResponse;
	}
	

	/**
	 * 
	 * @param orgs
	 * @param orgId
	 * @return
	 */
	protected CHResponse handleTree(List<TNOrg> orgs,String orgId) {
		CHResponse chResponse = new CHResponse();
		if(null != orgs && orgs.size()>0) {
			List<TreeProp> trees = new ArrayList<TreeProp>();
			TreeProp treeProp = null;
			for (TNOrg org : orgs) {
				treeProp = new TreeProp();
				treeProp.setId(org.getId());
				treeProp.setName(org.getOrgName());
				treeProp.setParentId(org.getParentId());
				treeProp.setSeqNum(org.getSeqNum());
				treeProp.setFlag(org.getType());
				treeProp.setUri(org.getId());
				trees.add(treeProp);
			}
			orgs = null;
			treeProp = new TreeProp();
			treeProp.setId(orgId);
			TreeHelper<TreeProp> treeHelper = new TreeHelper<TreeProp>();
			try {
				trees = treeHelper.outPutTree(trees, treeProp,true);
				if(null != trees && trees.size()>0) {
					chResponse.setResult(OP_SUCCESS);
					chResponse.setMsg(OP_SUCCESS_MSG);
					chResponse.setData(trees);
				}
			} catch (Exception e) {
				e.printStackTrace();
				trees = null;
			}
		}
		return chResponse;
	}

	public static void main(String[] args) {
		CHResponse chResponse = new CHResponse();
		OrgService aa = new OrgService();
		chResponse = aa.getOrgInfo("1");

	}

	public CHResponse getSoloOrgzTree(String orgCode) {
		CHResponse chResponse = new CHResponse();
		chResponse.setResult(OP_FAIL);
		chResponse.setMsg("组织机构树获取失败");
		OrgDao dao = new OrgDao();
		List<Object> list = dao.getSoloZnodes(orgCode);	
		if(list.size()>0){
			String dataStr = initZnodes(list);
			chResponse.setResult(OP_SUCCESS);
			chResponse.setMsg("获取成功！");
			chResponse.setData(dataStr);
		}

		return chResponse;
	}
	

}
