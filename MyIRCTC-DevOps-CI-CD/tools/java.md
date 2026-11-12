# Java

## What it does
Runtime and compiler for the MyIRCTC web application. It compiles the source into bytecode and runs the code during tests.

## Where it sits in the flow
Phase 2 (Jenkins CI) and inside the container (Tomcat). Maven uses the JDK to compile. Tomcat uses the JRE to run the WAR.

## What it receives and hands off
- **Receives:** `.java` source files from Maven.
- **Hands off:** compiled `.class` files, packaged into the WAR by Maven.

## Which stage calls it
- **Build** and **Test** (Jenkins CI): Maven calls `javac` through the JDK on the Jenkins server.
- **Runtime** (Docker/Tomcat container): Tomcat runs the compiled code.
