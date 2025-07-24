component{
    this.name="CFProductVault"
    this.sessionManagement = true;

    function onRequestStart(targetPage){
        if(!isDefined("session.user") and listlast(targetPage, "/")neq "index.cfm"){
            location("index.cfm");
            return false;
        }
    }
}