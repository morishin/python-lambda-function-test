package:
	docker build . -t packager
	docker run --rm -it -v $(PWD):/app packager
	zip deploy_package.zip lambda_function.py
	cd venv-for-deployment/lib/python2.7/site-packages && zip -r ../../../../deploy_package.zip * .*
	echo "Completed. Please upload deploy_package.zip to AWS Lambda"
