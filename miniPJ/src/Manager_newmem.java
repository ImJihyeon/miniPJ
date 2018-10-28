import java.awt.Button;
import java.awt.FlowLayout;
import java.awt.Frame;
import java.awt.GridLayout;
import java.awt.Label;
import java.awt.Panel;
import java.awt.TextField;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.WindowAdapter;
import java.awt.event.WindowEvent;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.swing.JOptionPane;

import static util.JdbcUtil.*;

public class Manager_newmem extends Frame implements ActionListener {
	Login login;
	DAOMember memDAO;
	Panel name_pan, id_pan, pw_pan, pw2_pan, addr_pan, hp_pan, title_pan, pan8, pan9, btn_pan;
	Label name_label, id_label, pw_label, pw2_label, addr_label, title_label, hp_label;
	TextField name_tf, id_tf, pw_tf, pw2_tf, addr_tf, hp_tf;
	Button check_btn, join_btn, cancel_btn;
	Connection conn;

	Manager_newmem() {
		conn = getConnection();
		memDAO = new DAOMember();
		name_pan = new Panel(new FlowLayout(FlowLayout.LEFT));
		id_pan = new Panel(new FlowLayout(FlowLayout.LEFT));
		pw_pan = new Panel(new FlowLayout(FlowLayout.LEFT));
		pw2_pan = new Panel(new FlowLayout(FlowLayout.LEFT));
		addr_pan = new Panel(new FlowLayout(FlowLayout.LEFT));
		hp_pan = new Panel(new FlowLayout(FlowLayout.LEFT));

		title_pan = new Panel();
		pan8 = new Panel();
		pan9 = new Panel();

		btn_pan = new Panel();
		name_label = new Label("이 름");
		name_label.setAlignment(Label.CENTER);
		id_label = new Label("I D");
		id_label.setAlignment(Label.CENTER);
		pw_label = new Label("비밀 번호");
		pw_label.setAlignment(Label.CENTER);
		pw2_label = new Label("비밀번호 확인");
		pw2_label.setAlignment(Label.CENTER);
		hp_label = new Label("전화 번호");
		hp_label.setAlignment(Label.CENTER);
		addr_label = new Label("주 소");
		addr_label.setAlignment(Label.CENTER);
		title_label = new Label("회원 가입");
		title_label.setAlignment(Label.CENTER);

		name_tf = new TextField(20);
		id_tf = new TextField(20);
		pw_tf = new TextField(20);
		pw_tf.setEchoChar('*');
		pw2_tf = new TextField(20);
		pw2_tf.setEchoChar('*');
		addr_tf = new TextField(20);
		hp_tf = new TextField(20);

		check_btn = new Button("중복체크");
		check_btn.addActionListener(this);

		join_btn = new Button();
		join_btn.setLabel("등록");
		join_btn.addActionListener(this);

		cancel_btn = new Button("가입취소");
		cancel_btn.addActionListener(this);

		title_pan.add(title_label);

		name_pan.add(name_tf);
		id_pan.add(id_tf);
		id_pan.add(check_btn);
		pw_pan.add(pw_tf);

		pw2_pan.add(pw2_tf);
		addr_pan.add(addr_tf);
		hp_pan.add(hp_tf);

		pan8.setLayout(new GridLayout(6, 1));
		pan8.add(name_label);
		pan8.add(id_label);
		pan8.add(pw_label);
		pan8.add(pw2_label);
		pan8.add(addr_label);
		pan8.add(hp_label);

		pan9.setLayout(new GridLayout(6, 1));

		pan9.add(name_pan);
		pan9.add(id_pan);
		pan9.add(pw_pan);
		pan9.add(pw2_pan);
		pan9.add(addr_pan);
		pan9.add(hp_pan);
		// pan9.add(pan10);

		btn_pan.add(join_btn);
		btn_pan.add(cancel_btn);

		add("North", title_pan);
		add("West", pan8);

		add("East", pan9);
		add("South", btn_pan);
		setSize(400, 400);
		setVisible(false);
		addWindowListener(new WindowHandler());

	}

	class WindowHandler extends WindowAdapter {
		public void windowClosing(WindowEvent e) {
			dispose();
		}
	}

	@Override
	public void actionPerformed(ActionEvent e) {
		if (e.getSource() == check_btn) {
			String id = id_tf.getText().trim();

			if (id.length() == 0) {
				JOptionPane.showMessageDialog(null, "ID를 입력해주세요.");
			} else {
				try {
					PreparedStatement pstmt;
					pstmt = conn.prepareStatement("select mem_id from member where mem_id = ?");
					pstmt.setString(1, id_tf.getText());
					ResultSet rs;
					rs = pstmt.executeQuery();

					int cnt = 0;
					while (rs.next())
						cnt++;
					if (cnt == 0) {
						JOptionPane.showMessageDialog(null, "사용 가능합니다.");
					} else {
						JOptionPane.showMessageDialog(null, "사용 불가능합니다.");
					}
					rs.close();
					pstmt.close();
				} catch (SQLException se) {
					se.printStackTrace();
				}
			}

		}
		if (e.getSource() == join_btn) {

			String name = name_tf.getText().trim();
			String id = id_tf.getText().trim();
			String pass = pw_tf.getText().trim();
			String pass2 = pw2_tf.getText().trim();
			String hp = hp_tf.getText().trim();
			String addr = addr_tf.getText().trim();

			if (name.length() == 0 || id.length() == 0 || pass.length() == 0 || hp.length() == 0
					|| addr.length() == 0) {
				JOptionPane.showMessageDialog(null, "빈 칸을 입력해주세요.");
			} else {
				if (!pass.equals(pass2)) {
					JOptionPane.showMessageDialog(null, "비밀번호가 일치하지 않습니다.");
				} else {
					int count = memDAO.insert(name, id, pass, hp, addr);

					if (count > 0) {
						JOptionPane.showMessageDialog(null, "가입 되었습니다.");
						Login.book_manager.getJPanel_Member().setTableData(0);

						dispose();

						// login = new Login();

					} else {
						JOptionPane.showMessageDialog(null, "가입 불가능합니다.");
					}

				}
			}
		}
		if (e.getSource() == cancel_btn) {
			String name = name_tf.getText().trim();
			String id = id_tf.getText().trim();
			String pass = pw_tf.getText().trim();
			String pass2 = pw2_tf.getText().trim();
			String hp = hp_tf.getText().trim();
			String addr = addr_tf.getText().trim();
			if (name.length() > 0 || id.length() > 0 || pass.length() > 0 || hp.length() > 0 || addr.length() > 0) {
				name_tf.setText(null);
				id_tf.setText(null);
				pw_tf.setText(null);
				pw2_tf.setText(null);
				addr_tf.setText(null);
				hp_tf.setText(null);
				dispose();
			} else {
				dispose();
			}
		}
	}
}
