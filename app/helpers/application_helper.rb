module ApplicationHelper
    def menu_principal(controllers)
        render partial: "layouts/menu_principal", locals: {opcoes: controllers}
    end
end