package model.sesionbeans;


import java.util.Map;
import java.util.Iterator;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.Query;


/**
 *
 * @author asathor
 */
public abstract class AbstractFacade<T> {

    private Class<T> entityClass;

    public AbstractFacade(Class<T> entityClass) {
        this.entityClass = entityClass;
    }


    protected abstract EntityManager getEntityManager();


    public void create(T entity) {
        getEntityManager().persist(entity);
    }


    public void edit(T entity) {
        getEntityManager().merge(entity);
    }


    public void remove(T entity) {
        getEntityManager().remove(getEntityManager().merge(entity));
    }


    public T find(Object id) {
        return getEntityManager().find(entityClass, id);
    }


    public List<T> findAll() {
        javax.persistence.criteria.CriteriaQuery cq = getEntityManager().getCriteriaBuilder().createQuery();
        cq.select(cq.from(entityClass));
        return getEntityManager().createQuery(cq).getResultList();
    }


    public List<T> findRange(int[] range) {
        javax.persistence.criteria.CriteriaQuery cq = getEntityManager().getCriteriaBuilder().createQuery();
        cq.select(cq.from(entityClass));
        javax.persistence.Query q = getEntityManager().createQuery(cq);
        q.setMaxResults(range[1] - range[0] + 1);
        q.setFirstResult(range[0]);
        return q.getResultList();
    }


    public int count() {
        javax.persistence.criteria.CriteriaQuery cq = getEntityManager().getCriteriaBuilder().createQuery();
        javax.persistence.criteria.Root<T> rt = cq.from(entityClass);
        cq.select(getEntityManager().getCriteriaBuilder().count(rt));
        javax.persistence.Query q = getEntityManager().createQuery(cq);
        return ((Long) q.getSingleResult()).intValue();
    }


    public List<T> findNamedQuery(String namedQueryName) {
        return getEntityManager().createNamedQuery(namedQueryName).getResultList();
    }


    public List<T> findNamedQuery(String namedQueryName, String parameterName, String parameterValue) {
        return getEntityManager().createNamedQuery(namedQueryName).setParameter(parameterName, parameterValue).getResultList();
    }


    public List<T> findNamedQuery(String namedQueryName, Map<String, String> parameters) {
        Query myQuery = getEntityManager().createNamedQuery(namedQueryName);
        Iterator<String> myIterator = parameters.keySet().iterator();
        while (myIterator.hasNext()) {
            String myKey = myIterator.next();
            myQuery.setParameter(myKey, parameters.get(myKey));
        }
        return myQuery.getResultList();
    }


}
