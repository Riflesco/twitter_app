class ApplicationController < ActionController::Base
    def heloblabla 
        render html: 'Hello,salut!'
    end
    
    def alta_ruta
       # render html: 'Ai intrat pe alta ruta!'
    end

    def create_user
        #user = User.create(name: params[:bla]);
       # render html: "Userul cu id: #{user.id} a fost creat"
       #render html: "Pagina create user"
    end
    
    def main_menu
        
    end
    
end
