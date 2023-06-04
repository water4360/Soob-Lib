package controller;

import common.MemberService;
import common.MemberServiceFactory;

public abstract class BaseController implements Controller {

	// controller들 묶어주기 + Service 상속용
	protected MemberService memService;
	
	public BaseController() {
		memService = MemberServiceFactory.newInstance();
	}

}
