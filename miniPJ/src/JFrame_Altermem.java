import static util.JdbcUtil.getConnection;

import java.awt.BorderLayout;
import java.awt.FlowLayout;
import java.awt.Font;
import java.awt.GridLayout;
import java.awt.Label;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.WindowAdapter;
import java.awt.event.WindowEvent;
import java.sql.Connection;

import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JOptionPane;
import javax.swing.JPanel;
import javax.swing.JPasswordField;
import javax.swing.JTextField;

public class JFrame_Altermem extends JFrame implements ActionListener {
	// クラス内で使われるメンバー変数を宣言する部分です。
	Login login;
	DAOMember memDAO;
	JPanel name_pan, id_pan, pw_pan, pw2_pan, addr_pan, hp_pan, title_pan, pan8, pan9, btn_pan;
	Label name_label, id_label, pw_label, pw2_label, addr_label, title_label, hp_label;
	JTextField name_tf, id_tf, addr_tf, hp_tf;
	JPasswordField pw_tf, pw2_tf;
	JButton alter_btn, cancel_btn, delete_btn;
	Connection conn;

	JFrame_Altermem(String user_name, String user_id, String user_hp, String user_addr) {
		conn = getConnection();
		memDAO = new DAOMember();
		setLocation(370,270);
		name_pan = new JPanel(new FlowLayout(FlowLayout.LEFT));
		id_pan = new JPanel(new FlowLayout(FlowLayout.LEFT));
		pw_pan = new JPanel(new FlowLayout(FlowLayout.LEFT));
		pw2_pan = new JPanel(new FlowLayout(FlowLayout.LEFT));
		addr_pan = new JPanel(new FlowLayout(FlowLayout.LEFT));
		hp_pan = new JPanel(new FlowLayout(FlowLayout.LEFT));
		Font title;

		title_pan = new JPanel();
		title_pan.setLayout(new BorderLayout());
		pan8 = new JPanel();
		pan9 = new JPanel();

		btn_pan = new JPanel();

		//labelはそれぞれの名前のLabelのオブジェクトを生成
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
		title = new Font("고딕", Font.BOLD, 20);
		title_label = new Label("**회원 수정**");
		title_label.setFont(title);
		title_label.setAlignment(Label.CENTER);

		//それぞれ20という長さのままTextFieldオブジェクトが生成
		name_tf = new JTextField(user_name, 20);
		id_tf = new JTextField(user_id, 20);
		id_tf.setEnabled(false);
		pw_tf = new JPasswordField(20);

		pw2_tf = new JPasswordField(20);

		addr_tf = new JTextField(user_addr, 20);
		hp_tf = new JTextField(user_hp, 20);

		// 버튼
		alter_btn = new JButton();
		alter_btn.setLabel("수정");
		alter_btn.addActionListener(this);
		cancel_btn = new JButton("취소");
		cancel_btn.addActionListener(this);
		delete_btn = new JButton("탈퇴");
		delete_btn.addActionListener(this);

		//title_pan部分にtitle_labelを貼り付ける
		title_pan.add(title_label);
		title_pan.add("East", delete_btn);

		// 各ラベルを左のパネルに入れる。
		name_pan.add(name_tf);
		id_pan.add(id_tf);
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

		btn_pan.add(alter_btn);
		btn_pan.add(cancel_btn);

		add("North", title_pan);
		add("West", pan8);

		add("East", pan9);
		add("South", btn_pan);
		//フレームのサイズ setting の部分になります.
		setSize(350, 400);
		// フレームを見せるかどうかを隠す部分
		setVisible(false);
		// フレームウィンドウ終了メソッド
		addWindowListener(new WindowHandler());

	}

	class WindowHandler extends WindowAdapter {
		public void windowClosing(WindowEvent e) {
			dispose();
		}
	}

	@Override
	public void actionPerformed(ActionEvent e) {
		if (e.getSource() == alter_btn) {

			String name = name_tf.getText().trim();
			String id = id_tf.getText().trim();
			String pass = pw_tf.getText().trim();
			String pass2 = pw2_tf.getText().trim();
			String hp = hp_tf.getText().trim();
			String addr = addr_tf.getText().trim();

			if (name.length() == 0 || pass.length() == 0 || hp.length() == 0 || addr.length() == 0) {
				JOptionPane.showMessageDialog(null, "공백값이 있습니다.");
				return;
			} else {
				if (!pass.equals(pass2)) {
					JOptionPane.showMessageDialog(null, "비밀번호가 일치하지 않습니다.");
				} else {
					int count = memDAO.update(name, id, pass, hp, addr);

					if (count > 0) {
						JOptionPane.showMessageDialog(null, "수정 되었습니다.");
						Login.dtou.setName(name);
						Login.dtou.setHp(hp);
						Login.dtou.setAddr(addr);
						dispose();

					} else {
						JOptionPane.showMessageDialog(null, "수정 불가능합니다.");
					}
				}
			}

		}
		if (e.getSource() == cancel_btn) {

			dispose();
		}
		if (e.getSource() == delete_btn) {
			int result = JOptionPane.showConfirmDialog(this, "정말로 탈퇴 하시겠습니까?", "확인", JOptionPane.YES_NO_OPTION,
					JOptionPane.QUESTION_MESSAGE);

			if (result == JOptionPane.YES_OPTION) {
				int a = memDAO.delete(Login.dtou.getId());
				
				if(a > 0) {
				System.exit(0);
				}

			}

		}
	}

}
