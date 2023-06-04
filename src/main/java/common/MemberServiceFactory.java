package common;

public class MemberServiceFactory {

	private static MemberService memService = null;
	
	public static MemberService newInstance() {
		
		//memService(내의 memDao) 생성된게 없으면 객체생성~
		if(memService == null) {
			memService = new MemberService();
		}
		
		return memService;
	}
}
