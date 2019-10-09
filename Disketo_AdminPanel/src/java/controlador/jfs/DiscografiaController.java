package controlador.jfs;


import controlador.jfs.util.JsfUtil;
import controlador.jfs.util.JsfUtil.PersistAction;
import java.io.Serializable;
import java.util.List;
import java.util.ResourceBundle;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.ejb.EJB;
import javax.ejb.EJBException;
import javax.enterprise.context.SessionScoped;
import javax.faces.component.UIComponent;
import javax.faces.context.FacesContext;
import javax.faces.convert.Converter;
import javax.faces.convert.FacesConverter;
import javax.inject.Named;
import modelo.Discografia;


@Named("discografiaController")
@SessionScoped
public class DiscografiaController implements Serializable {

    @EJB
    private controlador.jfs.DiscografiaFacade ejbFacade;
    private List<Discografia> items = null;
    private Discografia selected;

    public DiscografiaController() {
    }


    public Discografia getSelected() {
        return selected;
    }


    public void setSelected(Discografia selected) {
        this.selected = selected;
    }


    protected void setEmbeddableKeys() {
    }


    protected void initializeEmbeddableKey() {
    }


    private DiscografiaFacade getFacade() {
        return ejbFacade;
    }


    public Discografia prepareCreate() {
        selected = new Discografia();
        initializeEmbeddableKey();
        return selected;
    }


    public void create() {
        persist(PersistAction.CREATE, ResourceBundle.getBundle("/Bundle").getString("DiscografiaCreated"));
        if (!JsfUtil.isValidationFailed()) {
            items = null;    // Invalidate list of items to trigger re-query.
        }
    }


    public void update() {
        persist(PersistAction.UPDATE, ResourceBundle.getBundle("/Bundle").getString("DiscografiaUpdated"));
    }


    public void destroy() {
        persist(PersistAction.DELETE, ResourceBundle.getBundle("/Bundle").getString("DiscografiaDeleted"));
        if (!JsfUtil.isValidationFailed()) {
            selected = null; // Remove selection
            items = null;    // Invalidate list of items to trigger re-query.
        }
    }


    public List<Discografia> getItems() {
        if (items == null) {
            items = getFacade().findAll();
        }
        return items;
    }


    private void persist(PersistAction persistAction, String successMessage) {
        if (selected != null) {
            setEmbeddableKeys();
            try {
                if (persistAction != PersistAction.DELETE) {
                    getFacade().edit(selected);
                } else {
                    getFacade().remove(selected);
                }
                JsfUtil.addSuccessMessage(successMessage);
            } catch (EJBException ex) {
                String msg = "";
                Throwable cause = ex.getCause();
                if (cause != null) {
                    msg = cause.getLocalizedMessage();
                }
                if (msg.length() > 0) {
                    JsfUtil.addErrorMessage(msg);
                } else {
                    JsfUtil.addErrorMessage(ex, ResourceBundle.getBundle("/Bundle").getString("PersistenceErrorOccured"));
                }
            } catch (Exception ex) {
                Logger.getLogger(this.getClass().getName()).log(Level.SEVERE, null, ex);
                JsfUtil.addErrorMessage(ex, ResourceBundle.getBundle("/Bundle").getString("PersistenceErrorOccured"));
            }
        }
    }


    public Discografia getDiscografia(java.lang.Integer id) {
        return getFacade().find(id);
    }


    public List<Discografia> getItemsAvailableSelectMany() {
        return getFacade().findAll();
    }


    public List<Discografia> getItemsAvailableSelectOne() {
        return getFacade().findAll();
    }


    @FacesConverter(forClass = Discografia.class)
    public static class DiscografiaControllerConverter implements Converter {

        @Override
        public Object getAsObject(FacesContext facesContext, UIComponent component, String value) {
            if (value == null || value.length() == 0) {
                return null;
            }
            DiscografiaController controller = (DiscografiaController) facesContext.getApplication().getELResolver().
                    getValue(facesContext.getELContext(), null, "discografiaController");
            return controller.getDiscografia(getKey(value));
        }


        java.lang.Integer getKey(String value) {
            java.lang.Integer key;
            key = Integer.valueOf(value);
            return key;
        }


        String getStringKey(java.lang.Integer value) {
            StringBuilder sb = new StringBuilder();
            sb.append(value);
            return sb.toString();
        }


        @Override
        public String getAsString(FacesContext facesContext, UIComponent component, Object object) {
            if (object == null) {
                return null;
            }
            if (object instanceof Discografia) {
                Discografia o = (Discografia) object;
                return getStringKey(o.getIdDiscografia());
            } else {
                Logger.getLogger(this.getClass().getName()).log(Level.SEVERE, "object {0} is of type {1}; expected type: {2}", new Object[]{object, object.getClass().getName(), Discografia.class.getName()});
                return null;
            }
        }


    }

}
