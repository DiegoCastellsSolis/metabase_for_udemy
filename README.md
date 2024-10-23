# Metabase NOVA-BI
this repo containt info about metabase 

## Índice
- [Descargar Docker](#download_docker)
- [Descargar Repositorio](#download_repo)
- [Instancas de Docker](#deploy_instances_docker)
- [Importar Datos](#import_data)
- [Modificar DB](#modify_names_tablas) 
- [Contacto](#contact)

## download_docker
Para descargar docker redirigete al siguiente [link](https://docs.docker.com/desktop/install/windows-install/).
En mi caso elegi la version windows


## download_repo
Instrucciones para instalar el proyecto:
```bash
git clone https://github.com/DiegoCastellsSolis/metabase_for_udemy.git 
```

## deploy_instances_docker
Instrucciones para instalar el proyecto:
```bash
cd metabase_for_udemy
docker-compose up
```

## import_data
Sigue los siguientes paso para cargar nuestros datasets en la base de datos
![Diagrama del Proyecto](https://github.com/DiegoCastellsSolis/metabase_for_udemy/blob/main/images/our_analytics.png)
![Diagrama del Proyecto](https://github.com/DiegoCastellsSolis/metabase_for_udemy/blob/main/images/import_data.png)
Los archivos a cargar deben ser del formato csv

## modify_names_tablas
```sql
USE DB_ACTUAL;
ALTER TABLE DB_ACTUAL.NOMBRE_ACTUAL RENAME TO NOMBRE_NUEVO;
```

## contact
- **LinkedIn**: [https://www.linkedin.com/in/diego-castells-solis-9a2783201/](https://www.linkedin.com/in/diego-castells-solis-9a2783201/)
- **Gmail**: [diegoosolis99@gmail.com](mailto:diegoosolis99@gmail.com)