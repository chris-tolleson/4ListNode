all: 
	build-wrapper-win-x86-64.exe --out-dir  build_wrapper_output_directory MSBuild.exe /t:Rebuild /nodeReuse:False
	$env:SONAR_TOKEN='d820f85115c55286a665871bb238f9529f07a375'
	sonar-scanner.bat -D"sonar.organization=vel" -D"Sonar.projectKey=testClangFeatures" -D"sonar.sources." -D "sonar.cfamily.build-wrapper-output=build_wrapper_output_directory" -D"sonar.host.url=https://sonarcloud.io" -X


