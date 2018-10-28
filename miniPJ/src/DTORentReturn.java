
public class DTORentReturn {
	int book_num;
	String book_name;
	String book_writer;
	String book_com;
	String mem_id;
	
	public DTORentReturn(int book_num, String book_name, String book_writer, String book_com, String mem_id) {
		super();
		this.book_num = book_num;
		this.book_name = book_name;
		this.book_writer = book_writer;
		this.book_com = book_com;
		this.mem_id = mem_id;
	}

	public int getBook_num() {
		return book_num;
	}

	public void setBook_num(int book_num) {
		this.book_num = book_num;
	}

	public String getBook_name() {
		return book_name;
	}

	public void setBook_name(String book_name) {
		this.book_name = book_name;
	}

	public String getBook_writer() {
		return book_writer;
	}

	public void setBook_writer(String book_writer) {
		this.book_writer = book_writer;
	}

	public String getBook_com() {
		return book_com;
	}

	public void setBook_com(String book_com) {
		this.book_com = book_com;
	}

	public String getMem_id() {
		return mem_id;
	}

	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	
	
}
