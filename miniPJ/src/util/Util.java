package util;

import java.awt.Dimension;
import java.awt.Point;
import java.awt.Toolkit;

public class Util {
	public static Point setLocationC(Dimension d) {
		int resolutionW = Toolkit.getDefaultToolkit().getScreenSize().width;
		int resolutionH = Toolkit.getDefaultToolkit().getScreenSize().height;
		Point p = new Point();
		p.x = (resolutionW/2)-(d.width/2);
		p.y = (resolutionH/2)-(d.height/2);
		
		return p;
	}
}
