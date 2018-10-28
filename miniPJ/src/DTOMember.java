
public class DTOMember {
	private int num;
	private String name;
	private String id;
	private String pw;
	private String hp;
	private String addr;

	@Override
	public String toString() {
		return "DTOMember [num=" + num + ", name=" + name + ", id=" + id + ", hp=" + hp + ", addr=" + addr + "]";
	}

	public DTOMember() {
	}

	public DTOMember(int num, String name, String id, String pw, String hp, String addr) {
		super();
		this.num = num;
		this.name = name;
		this.id = id;
		this.pw = pw;
		this.hp = hp;
		this.addr = addr;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getId() {
		return id;
	}

	public void setId(String iD) {
		this.id = id;
	}

	public String getPw() {
		return pw;
	}

	public void setPw(String pw) {
		this.pw = pw;
	}

	public String getHp() {
		return hp;
	}

	public void setHp(String hp) {
		this.hp = hp;
	}

	public String getAddr() {
		return addr;
	}

	public void setAddr(String addr) {
		this.addr = addr;
	}
}
