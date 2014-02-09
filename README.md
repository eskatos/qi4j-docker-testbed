# Qi4j SDK Docker Test Bed

Docker is at http://docker.io

Qi4j is at http://qi4j.org

Build with:

    docker build -t <yourname>/qi4j-testbed .

Start with:

    $QI4J_TESTBED=$(docker run -p 11211:11211 -p 6379:6379 -p 27017:27017 -d <yourname>/qi4j-testbed)

Run Qi4j SDK Test Suite.

Stop with:

	docker kill $QI4J_TESTBED
