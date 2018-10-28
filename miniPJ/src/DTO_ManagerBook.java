import java.sql.Date;

public class DTO_ManagerBook {
	String mem_id;
	int mem_num;
	Date rent_date;
	Date return_date;
	
	public DTO_ManagerBook() {}
	

	public DTO_ManagerBook(String mem_id, int mem_num, Date rent_date, Date return_date) {
		super();
		this.mem_id = mem_id;
		this.mem_num = mem_num;
		this.rent_date = rent_date;
		this.return_date = return_date;
	}

	public String getMem_id() {
		return mem_id;
	}

	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}

	public int getMem_num() {
		return mem_num;
	}

	public void setMem_num(int mem_num) {
		this.mem_num = mem_num;
	}

	public Date getRent_date() {
		return rent_date;
	}

	public void setRent_date(Date rent_date) {
		this.rent_date = rent_date;
	}

	public Date getReturn_date() {
		return return_date;
	}

	public void setReturn_date(Date return_date) {
		this.return_date = return_date;
	}

	
	
	
}
