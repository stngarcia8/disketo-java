package Helper;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;


/**
 * @author asathor
 */
public abstract class SelectQuery {

    protected Session mySession;
    protected Query myQuery;
    protected String querySelect;
    protected String queryFrom;
    protected String queryWhere;
    protected String queryOrderBy;

    public SelectQuery() {
        this.mySession = HibernateUtil.getSessionFactory().getCurrentSession();
        this.querySelect = "";
        this.queryFrom = "";
        this.queryWhere = "";
        this.queryOrderBy = "";
    }


    protected void querySet() throws Exception {
        Transaction myTransaction = this.mySession.beginTransaction();
        myQuery = this.mySession.createQuery(querySelect + queryFrom + queryWhere + queryOrderBy);
    }


    protected void parameterSet(String paramName, Object paramValue) {
        myQuery.setParameter(paramName, paramValue);
    }


    protected void queryClose() {
        this.mySession.close();
    }


}
