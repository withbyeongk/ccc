//package com.kh.ccc.board.playground;
//
//import java.awt.Dimension;
//import java.awt.Font;
//import java.awt.Image;
//import java.awt.event.ActionEvent;
//import java.awt.event.ActionListener;
//
//import javax.servlet.http.HttpServletRequest;
//import javax.swing.ImageIcon;
//import javax.swing.JButton;
//import javax.swing.JFrame;
//import javax.swing.JLabel;
//import javax.swing.JPanel;
//
//public class WorldCup {
//	static JPanel panelNorth;
//	static JPanel panelCenter;
//	static JLabel labelMessage;
//	static JLabel labelVs;
//	static JButton buttonLeft;
//	static JButton buttonRight;
//	static String[] images = {
//		"WC1.PNG","WC2.PNG","WC3.PNG","WC4.PNG"
//		,"WC5.PNG","WC6.PNG","WC7.PNG","WC8.PNG"
//	 };
//	static int imageIndex = 2; //3번쨰 이미지에 index initalized 가르키도록
//	static HttpServletRequest request;
//	//function : image 를 버튼 컨트롤
//	static ImageIcon changeImage(String filename) {
//		String path = "C:\\Users\\user1\\Desktop\\1229fi\\CCC\\src\\main\\webapp\\WEB-INF\\views\\worldCup\\";
////		String path = System.getProperty("user.dir");
////		path += "\\src\\main\\webapp\\WEB-INF\\views\\worldCup\\";
//		System.out.println("path : "+path);
//		ImageIcon icon = new ImageIcon(path+filename);
//		Image originImage = icon.getImage();
//		Image changeImage = originImage.getScaledInstance(450,450,Image.SCALE_SMOOTH);
//		ImageIcon icon_new = new ImageIcon(changeImage);
//		return icon_new;
//	}
//	
//	
//	static class MyFrame extends JFrame implements ActionListener{
//		public MyFrame(String title) {
//			super(title);
//			this.setSize(450,450);
//			this.setVisible(true);
//			this.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
//			
//			panelNorth = new JPanel();
//			labelMessage = new JLabel("Find Your CharActer");
//			labelMessage.setFont(new Font("Arial",Font.BOLD,20));
//			panelNorth.add(labelMessage);
//			this.add("North", panelNorth);
//			
//			panelCenter = new JPanel();
//			labelVs = new JLabel("vs");
//			labelVs.setFont(new Font("Arial",Font.BOLD,20));
//			buttonLeft = new JButton("LeftButton"); //왼쪽에 버튼만들고
//			buttonLeft.setIcon(changeImage("WC1.PNG"));//첫번째 버튼이미지 등록
//			buttonLeft.setPreferredSize(new Dimension(450,450)); //setPreferredSize 을 이용해야 크기가 잘 적용됨
//			buttonRight = new JButton("buttonRight"); //왼쪽에 버튼만들고
//			buttonRight.setIcon(changeImage("WC2.PNG"));//첫번째 버튼이미지 등록
//			buttonRight.setPreferredSize(new Dimension(450,450)); //setPreferredSize 을 이용해야 크기가 잘 적용됨
//			
//			//아래는 버튼에 클릭이벤트
//			buttonLeft.addActionListener(this);
//			buttonRight.addActionListener(this);
//			panelCenter.add(buttonLeft);
//			panelCenter.add(labelVs);
//			panelCenter.add(buttonRight);
//			this.add("Center", panelCenter);
//			
//			this.pack(); //clear empty space = >빈 공간을 없애서 최적화시켜주는거
//		}
//		
//		
//		//아래꺼는 바로 위에서 imple로  만든거임
//		//아래는 버튼 클릭 이벤트 callback
//		
//		@Override
//		public void actionPerformed(ActionEvent e) {
//			//바로 아래는 //ex 8강이면 8번째 눌르면 오류가 나기때문에 예외처리
//			if(imageIndex==8) {
//				//마지막 캐릭터
//				labelMessage.setText("Found Your CharActer!!"); //당신의 이상형을 찾았음
//				//Show One Image
//				if(e.getActionCommand().equals("buttonLeft")) { //왼쪽버튼이면
//					//왼쪽버튼을 남겨야지  그래서 오른쪽 숨겨
//					buttonRight.hide();
//					labelVs.hide();
//				}else {
//					//오른쪽 숨겨
//					buttonLeft.hide();
//					labelVs.hide();
//				}
//				
//			}else {
//					
//				
//				if(e.getActionCommand().equals("LeftButton")) {
//					// buttonLeft 문구가  이쪽으로오게됨 (문자열)
//					buttonRight.setIcon(changeImage(images[imageIndex])); //왼쪽을 누르면  오른쪽이 바뀌면됨
//					imageIndex++;
//				}else {
//					// buttonRight 문구가  이쪽으로오게됨 (문자열)
//					buttonLeft.setIcon(changeImage(images[imageIndex]));  //오른쪽을눌럿다면 왼쪽이 바뀌면 됨
//					imageIndex++;
//				}
//			}
//		}
//	}
//	
//	public static void main(String[] args) {
//		
//		new MyFrame("Idol World Cup");
//	}
//}