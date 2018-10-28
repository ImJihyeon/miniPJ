import static util.JdbcUtil.close;
import static util.JdbcUtil.getConnection;
import static util.Util.setLocationC;

import java.awt.BorderLayout;
import java.awt.Color;
import java.awt.Dimension;
import java.awt.Font;
import java.awt.Frame;
import java.awt.Point;
import java.awt.TextField;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.WindowAdapter;
import java.awt.event.WindowEvent;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.swing.BorderFactory;
import javax.swing.ImageIcon;
import javax.swing.JButton;
import javax.swing.JLabel;
import javax.swing.JOptionPane;
import javax.swing.JPanel;

public class Login extends Frame implements ActionListener {
	final static int FRAME_WIDTH  = 570;
	final static int FRAME_HEIGHT = 300;

	JLabel id_label, pw_label;
	TextField id_tf, pw_tf;
	JButton newID, ok;
	JPanel total, id_pan, pw_pan, button_pan;
	JLabel img_label;
	ImageIcon img = new ImageIcon("binimg.png");
	Connection conn;
	PreparedStatement pstmt;
	ResultSet rs;
	String loginid;
	String pass;
	String sql = "select mem_name, mem_pw, mem_hp, mem_addr from member where mem_id = ?";
	String admin = "admin";
	int row;
	boolean flag = false;
	JFrame_Newmem nmf;
	static Manager book_manager;
	static DTOUser dtou;
	static User user;

	public Login() {
		conn = getConnection();
		addWindowListener(new WindowAdapter() {
			public void windowClosing(WindowEvent e) {
				System.exit(0);
			}
		});
		setFont(new Font("고딕체", Font.BOLD, 15));
		setBackground(Color.white);
		Point point = setLocationC(new Dimension(FRAME_WIDTH, FRAME_HEIGHT));
		setBounds(point.x, point.y, FRAME_WIDTH, FRAME_HEIGHT);
		setResizable(false);

		id_label = new JLabel("ID:  ");
		pw_label = new JLabel("PW: ");
		id_tf = new TextField(13);
		pw_tf = new TextField(13);
		pw_tf.setEchoChar('*');
		newID = new JButton("신규가입");
		ok = new JButton(" 로 그 인 ");
		total = new JPanel();
		total.setBackground(Color.white);
		total.setBorder(BorderFactory.createEmptyBorder(75, 0, 0, 0));
		pw_pan = new JPanel();
		pw_pan.setBackground(Color.white);
		id_pan = new JPanel();
		id_pan.setBackground(Color.white);
		button_pan = new JPanel();
		button_pan.setBackground(Color.white);
		img_label = new JLabel(img);
		img_label.setBackground(Color.white);

		add(img_label, BorderLayout.WEST);

		id_pan.setPreferredSize(new Dimension(175, 65));

		id_pan.add(id_label);
		id_pan.add(id_tf);
		id_pan.add(pw_label);
		id_pan.add(pw_tf);
		button_pan.add(newID);
		button_pan.add(ok);

		total.add(id_pan);
		total.add(button_pan);

		add(total);

		setVisible(true);

		addWindowListener(new WindowAdapter() {
			public void windowClosing(WindowEvent e) {
				System.exit(0);
			}
		});

		nmf = new JFrame_Newmem();

		eventUp();
	}

	@SuppressWarnings("deprecation")
	public void loginCheck() {
		loginid = id_tf.getText().trim();
		pass = pw_tf.getText().trim();

		if (loginid.length() == 0) {
			JOptionPane.showMessageDialog(this, "ID를 입력");
			pw_tf.setText(null);
			id_tf.requestFocus(); // Focus合わせ
		} // idに入力値がない場合
		else if (pass.length() == 0) {
			JOptionPane.showMessageDialog(this, "비밀번호를 입력");
			pw_tf.requestFocus();
		} // passに入力値がない場合
		else {
			try {

				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, loginid);
				rs = pstmt.executeQuery();
				if (rs.next()) {
					String name = rs.getString("mem_name");
					if (pass.equals(rs.getString("mem_pw"))) {

						String hp = rs.getString("mem_hp");
						String addr = rs.getString("mem_addr");
						dtou = new DTOUser(loginid, name, addr, hp);

						if (admin.equals(loginid)) {
							JOptionPane.showMessageDialog(this, loginid + "관리자님 환영합니다.");

							setVisible(false);
							// 管理者のメーンフレームtrueに変更
							book_manager = new Manager();
						} else {
							JOptionPane.showMessageDialog(this, loginid + "님 환영합니다.");
							setVisible(false);
							// 会員"メインフレーム"trueに変更
							user = new User();
						}
						close(rs);
						close(pstmt);
						return;
					} else {
						JOptionPane.showMessageDialog(this, pass + "비밀번호가 일치하지 않습니다.");
						pw_tf.setText("");
						pw_tf.requestFocus();
					}
				} else {
					JOptionPane.showMessageDialog(this, "존재하지 않는 아이디입니다.");
					id_tf.setText("");
					pw_tf.setText("");
					id_tf.requestFocus();
				}
			} catch (Exception e) {
				System.out.println("ID, pass 검색 실패" + e);
			}
		}
	}

	public void eventUp() {
		newID.addActionListener(this);
		ok.addActionListener(this);
	}

	public void actionPerformed(ActionEvent e) {
		Object ob = e.getSource();
		if (ob == newID) {
			nmf.setVisible(true);
		} else if (ob == ok) {
			loginCheck();
		}

	}

	public static void main(String[] args) {
		Login login = new Login();

	}
}
