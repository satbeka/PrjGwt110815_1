package dboperation.loginInfo;


import java.io.Serializable;

public class UserLoginInfo implements Serializable {

    public String getLogin() {
        return login;
    }

    public void setLogin(String login) {
        this.login = login;
    }

    public String getPwd() {
        return pwd;
    }

    public void setPwd(String pwd) {
        this.pwd = pwd;
    }

    public boolean isConnect() {
        return isConnect;
    }

    public void setIsConnect(boolean isConnect) {
        this.isConnect = isConnect;
    }

    private String login;
    private String pwd;
    private boolean isConnect;
    private String session;
    private static final long serialVersionUID = 1L;

    public String getSession() {
        return session;
    }

    public void setSession(String session) {
        this.session = session;
    }
}


