
SCM provider autodetection failed. Please use "sonar.scm.provider" to define SCM of your project, or disable the SCM Sensor in the project settings.―ΈΎ0

CFamily plugin supports incremental analysis with the use of a cache:

* if you do not want to enable cache
  please explicitly disable it
  by setting the following property to your analysis:
  sonar.cfamily.cache.enabled=false

* to enable cache please specify the following 2 options:
  sonar.cfamily.cache.enabled=true
  sonar.cfamily.cache.path=relative_or_absolute_path_to_cache_location

* visit the documentation page for more information
  https://docs.sonarcloud.io/advanced-setup/languages/c-c-objective-c/
νΈΈΎ0