package servlets;
 
import java.sql.*;
 
public class PostgresDB {
 
    private String driver;
    private String url;
    private String user;
    private String password;
    private Connection connection;
    private Statement statement;
    private ResultSet resultset;
 
    /**
     * コンストラクタ
     * @param driver ドライバー
     * @param url URL
     * @param user ユーザー名
     * @param password パスワード
     */
    public DBAccess(String driver, String url, String user, String password) {
        this.driver = driver;
        this.url = url;
        this.user = user;
        this.password = password;
    }
 
    /**
     * 引数なしのコンストラクタ
     * 既定値を使用する
     */
    public DBAccess() {
        driver = "org.postgresql.Driver";
        url = "jdbc:postgresql://ec2-107-22-160-185.compute-1.amazonaws.com:5432/deck0jp8rljjoa";
        user = "uxsvvqdujoyrti";
        password = "2d989239c38338117217f11fbd0bfc7cca8d1a671c3f395a833e0eab7932050c";

    }
 
    /**
     * データベースへの接続を行う
     */
    public synchronized void open() throws Exception {
        Class.forName(driver);
        connection = DriverManager.getConnection(url, user, password);
        statement = connection.createStatement();
    }
 
    /**
     * SQL 文を実行した結果の ResultSet を返す
     * @param sql SQL 文
     */
    public ResultSet getResultSet(String sql) throws Exception {
        if ( statement.execute(sql) ) {
            return statement.getResultSet();
        }
        return null;
    }
 
    /**
     * SQL 文の実行
     * @param sql SQL 文
     */
    public void execute(String sql) throws Exception {
        statement.execute(sql);
    }
 
    /**
     * データベースへのコネクションのクローズ
     */
    public synchronized void close() throws Exception {
        if ( resultset != null ) resultset.close();
        if ( statement != null ) statement.close();
        if ( connection != null ) connection.close();
    }
}