package cn.com.chinaccs.bean.driver;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import cn.com.chinaccs.bean.BaseBeanImpl;
/**
 * 场地信息
 * @author Tsui
 *
 */
@Entity
@Table(name="traning_field_infomation")
public class TrainingField extends BaseBeanImpl {

	/**
	 * 
	 */
	private static final long serialVersionUID = -6114597524818461687L;
	private String id;
	private String fieldInx;
	private String status;
	private String fieldName;
	
	@Override
	@Column(name="id")
	@Id
	public String getId() {
		// TODO Auto-generated method stub
		return this.id;
	}

	@Override
	public void setId(String id) {
		this.id = id;
	}

	@Column(name="status")
	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	@Column(name="field_name")
	public String getFieldName() {
		return fieldName;
	}

	public void setFieldName(String fieldName) {
		this.fieldName = fieldName;
	}
	
	@Column(name="field_idx")
	public String getFieldInx() {
		return fieldInx;
	}

	public void setFieldInx(String fieldInx) {
		this.fieldInx = fieldInx;
	}

}
