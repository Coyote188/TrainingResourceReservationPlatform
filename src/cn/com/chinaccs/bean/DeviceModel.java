package cn.com.chinaccs.bean;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "e_device")
public class DeviceModel extends BaseBeanImpl{
	
	private String id;
	private String devModel; //设备型号
	private String devType; //设备类别
	private String devIcon;//设备名称
	private long distance;//通信距离
	private String frequencyRange;//频率范围
	private int channel;//信道数
	
	private String devDesc;
	private String wirelessAccessAsClient; //无线连接
	private String wiredAccessAsClient; //有限连接
	private String wirelessAccessAsServer; //无线连接
	private String wiredAccessAsServer; //有限连接
	private String note;
	/**
	 * @return the id
	 */
	@Override
	@Id
	@Column(name="dev_id")
	public String getId() {
		return id;
	}
	/**
	 * @return the devModel
	 */
	@Column(name="dev_model")
	public String getDevModel() {
		return devModel;
	}
	/**
	 * @return the devType
	 */
	@Column(name="dev_type")
	public String getDevType() {
		return devType;
	}
	/**
	 * @return the devName
	 */
	@Column(name="dev_icon")
	public String getDevIcon() {
		return devIcon;
	}
	/**
	 * @return the distance
	 */
	@Column(name="distance")public long getDistance() {
		return distance;
	}
	/**
	 * @return the frequencyRange
	 */
	@Column(name="frequency_range")
	public String getFrequencyRange() {
		return frequencyRange;
	}
	/**
	 * @return the channel
	 */
	@Column(name="channel")public int getChannel() {
		return channel;
	}
	/**
	 * @return the note
	 */
	@Column(name="note")public String getNote() {
		return note;
	}
	/**
	 * @param id the id to set
	 */
	public void setId(String id) {
		this.id = id;
	}
	/**
	 * @param devModel the devModel to set
	 */
	public void setDevModel(String devModel) {
		this.devModel = devModel;
	}
	/**
	 * @param devType the devType to set
	 */
	public void setDevType(String devType) {
		this.devType = devType;
	}
	/**
	 * @param devName the devName to set
	 */
	public void setDevIcon(String devIcon) {
		this.devIcon = devIcon;
	}
	/**
	 * @param distance the distance to set
	 */
	public void setDistance(long distance) {
		this.distance = distance;
	}
	/**
	 * @param frequencyRange the frequencyRange to set
	 */
	public void setFrequencyRange(String frequencyRange) {
		this.frequencyRange = frequencyRange;
	}
	/**
	 * @param channel the channel to set
	 */
	public void setChannel(int channel) {
		this.channel = channel;
	}
	/**
	 * @param note the note to set
	 */
	public void setNote(String note) {
		this.note = note;
	}
	/**
	 * @return the wirelessAccessAsClient
	 */
	@Column(name="wireless_client")public String getWirelessAccessAsClient() {
		return wirelessAccessAsClient;
	}
	/**
	 * @return the wiredAccessAsClient
	 */
	@Column(name="wired_client")public String getWiredAccessAsClient() {
		return wiredAccessAsClient;
	}
	/**
	 * @return the wirelessAccessAsServer
	 */
	@Column(name="wireless_server")public String getWirelessAccessAsServer() {
		return wirelessAccessAsServer;
	}
	/**
	 * @return the wiredAccessAsServer
	 */
	@Column(name="wired_server")public String getWiredAccessAsServer() {
		return wiredAccessAsServer;
	}
	/**
	 * @param wirelessAccessAsClient the wirelessAccessAsClient to set
	 */
	public void setWirelessAccessAsClient(String wirelessAccessAsClient) {
		this.wirelessAccessAsClient = wirelessAccessAsClient;
	}
	/**
	 * @param wiredAccessAsClient the wiredAccessAsClient to set
	 */
	public void setWiredAccessAsClient(String wiredAccessAsClient) {
		this.wiredAccessAsClient = wiredAccessAsClient;
	}
	/**
	 * @param wirelessAccessAsServer the wirelessAccessAsServer to set
	 */
	public void setWirelessAccessAsServer(String wirelessAccessAsServer) {
		this.wirelessAccessAsServer = wirelessAccessAsServer;
	}
	/**
	 * @param wiredAccessAsServer the wiredAccessAsServer to set
	 */
	public void setWiredAccessAsServer(String wiredAccessAsServer) {
		this.wiredAccessAsServer = wiredAccessAsServer;
	}
	@Column(name="dev_desc")public String getDevDesc() {
		return devDesc;
	}
	public void setDevDesc(String devDesc) {
		this.devDesc = devDesc;
	}
	
	
}
