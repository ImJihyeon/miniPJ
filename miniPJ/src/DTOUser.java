
public class DTOUser {
	private String id;
	private String name;
	private String addr;
	private String hp;
	
	public DTOUser() {}
	
	public DTOUser(String id, String name, String addr, String hp) {
		super();
		this.id = id;
		this.name = name;
		this.addr = addr;
		this.hp = hp;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	public String getHp() {
		return hp;
	}
	public void setHp(String hp) {
		this.hp = hp;
	}
	

}
