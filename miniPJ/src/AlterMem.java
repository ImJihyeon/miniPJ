import static util.JdbcUtil.getConnection;

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

public class AlterMem extends Frame implements ActionListener {
	// クラス内で使われるメンバー変数を宣言する部分です。
	Login login;
	DAOMember memDAO;
	Panel name_pan, id_pan, pw_pan, pw2_pan, addr_pan, hp_pan, title_pan, pan8, pan9, btn_pan;
	Label name_label, id_label, pw_label, pw2_label, addr_label, title_label, hp_label;
	TextField name_tf, id_tf, pw_tf, pw2_tf, addr_tf, hp_tf;
	Button alter_btn, cancel_btn;
	Connection conn;

	AlterMem(String user_name, String user_id, String user_hp, String user_addr) {
		conn = getConnection();
		memDAO = new DAOMember();
		// 画面配置を始めることになる部分
		// p1~p3までオブジェクト生成をしながらFlowLayoutを使って画面配置
		name_pan = new Panel(new FlowLayout(FlowLayout.LEFT));
		id_pan = new Panel(new FlowLayout(FlowLayout.LEFT));
		pw_pan = new Panel(new FlowLayout(FlowLayout.LEFT));
		pw2_pan = new Panel(new FlowLayout(FlowLayout.LEFT));
		addr_pan = new Panel(new FlowLayout(FlowLayout.LEFT));
		hp_pan = new Panel(new FlowLayout(FlowLayout.LEFT));

		// button panel

		// 北パネルの会員加入
		title_pan = new Panel();
		// table panel
		pan8 = new Panel();
		pan9 = new Panel();

		btn_pan = new Panel();

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
		title_label = new Label("회원 수정");
		title_label.setAlignment(Label.CENTER);

		// それぞれ20という長さのままTextFieldオブジェクトが生成
		name_tf = new TextField(user_name, 20);
		id_tf = new TextField(user_id, 20);
		id_tf.setEnabled(false);
		pw_tf = new TextField(20);
		pw_tf.setEchoChar('*');
		pw2_tf = new TextField(20);
		pw2_tf.setEchoChar('*');
		addr_tf = new TextField(user_addr, 20);
		hp_tf = new TextField(user_hp, 20);

		// buttons
		alter_btn = new Button();
		alter_btn.setLabel("수정");
		alter_btn.addActionListener(this);
		cancel_btn = new Button("취소");
		cancel_btn.addActionListener(this);

		// title_pan部分にtitle_labelを貼り付ける
		title_pan.add(title_label);

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

		btn_pan.add(alter_btn);
		btn_pan.add(cancel_btn);

		add("North", title_pan);
		add("West", pan8);

		add("East", pan9);
		add("South", btn_pan);
		// フレームのサイズ setting の部分になります.
		setSize(400, 400);
		// フレームを表示するかどうかをセッティングする部分
		setVisible(false);
		//フレームウィンドウ終了メソッド
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
			//会員情報修正時メッセージダイアログ
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
						Login.book_manager.getJPanel_Member().setTableData(0);
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
	}
}
