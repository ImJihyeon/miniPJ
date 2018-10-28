

public class DTOBook {

	private int num;
	private String name;
	private String writer;
	private String com;
	
	public DTOBook() {}

	public DTOBook(int num, String name, String writer, String com) {
		super();
		this.num = num;
		this.name = name;
		this.writer = writer;
		this.com = com;
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

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public String getCom() {
		return com;
	}

	public void setCom(String com) {
		this.com = com;
	}
}
