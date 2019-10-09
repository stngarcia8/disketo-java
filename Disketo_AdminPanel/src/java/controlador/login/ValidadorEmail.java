package controlador.login;


import java.util.Map;
import java.util.regex.Pattern;
import javax.faces.application.FacesMessage;
import javax.faces.component.UIComponent;
import javax.faces.context.FacesContext;
import javax.faces.validator.FacesValidator;
import javax.faces.validator.Validator;
import javax.faces.validator.ValidatorException;


/**
 * @author asathor
 */
@FacesValidator("emailValidator")
public class ValidadorEmail implements Validator {

    // Variables locales.
    private Pattern patronRegEx;
    private static final String patron = "^[_A-Za-z0-9-\\+]+(\\.[_A-Za-z0-9-]+)*@" + "[A-Za-z0-9-]+(\\.[A-Za-z0-9]+)*(\\.[A-Za-z]{2,})$";

    public ValidadorEmail() {
        this.patronRegEx = Pattern.compile(patron);
    }


    public void validate(FacesContext context, UIComponent component, Object value) throws ValidatorException {
        if (value == null) {
            throw new ValidatorException(new FacesMessage(FacesMessage.SEVERITY_ERROR, "Error de validación",
                    " El email no puede estar vacío, favor ingrese una dirección de email válida"));
        }
        if (!this.patronRegEx.matcher(value.toString()).matches()) {
            throw new ValidatorException(new FacesMessage(FacesMessage.SEVERITY_ERROR, "Error de validación",
                    value + " no es un email válido, favor ingrese una dirección de email válida"));
        }
    }


    public Map<String, Object> getMetadata() {
        return null;
    }


    public String getValidatorId() {
        return "emailValidator";
    }


}
