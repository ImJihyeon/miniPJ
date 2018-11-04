package kr.co.enough.action;

//ロジック制御,画面配信
public class ActionForward {
	private boolean isRedirect = false;
	private String path = null;
	/**
     * Redirect 사용여부, false이면 Forward 사용
     * @return isRedirect
     */

	public boolean isRedirect() {
		return isRedirect;
	}
	public void setRedirect(boolean isRedirect) {
		this.isRedirect = isRedirect;
	}
	public String getPath() {
		return path;
	}
	public void setPath(String path) {
		this.path = path;
	}
	
	
}
