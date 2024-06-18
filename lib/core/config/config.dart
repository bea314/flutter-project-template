class CoreConfig {
  static const String title = 'Project Template';
  static const String version = '0.0.0';
}

class CoreApi {
  static const bool produccion = false;     
  static const bool uat        = false;
  static const bool https      = false;      

  static const String protocolo             = (https         ? 'https' : 'http');
  static const String ipServicios           = (https)
                                                ?(produccion ? '127.0.0.1'   : '127.0.0.1') 
                                                :(produccion ? '127.0.0.1' : (uat) ? '127.0.0.1' :'127.0.0.1');
}