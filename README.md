# Socat Proxy Docker Image

This Docker image provides a simple way to set up a TCP proxy using `socat`. It enables traffic forwarding between a source port on the host machine and a destination IP and port, which can be another machine or service. 

## Purpose

The primary purpose of this image is to serve as a TCP proxy, allowing users to forward network traffic from a specified source port to a target IP and port. This can be helpful in various scenarios, such as:

- Redirecting traffic to services in different network segments.
- Testing services by simulating connections from different IPs or ports.
- Acting as a bridge between local and remote environments.

## Environment Variables

The following environment variables can be set to customize the behavior of the `socat` proxy:

- `SOURCE_PORT`: The port on the host machine that `socat` will listen on for incoming connections.
- `DEST_PORT`: The port on the destination machine that `socat` will forward traffic to.
- `DEST_IP`: The IP address of the destination machine that `socat` will forward traffic to.

## Usage

1. **Build the Docker Image**:
   If you haven't already built the image, you can do so with the following command:
   ```bash
   docker build -t socat-proxy .
   ```

2. **Run the Container**
    You can start the container by using docker run and setting the necessary environment variables. 
    This example demonstrates setting up a proxy that listens on SOURCE_PORT and forwards to DEST_IP:DEST_PORT.
    ```bash
    docker run -e SOURCE_PORT=8080 -e DEST_PORT=9090 -e DEST_IP=192.168.0.20 socat-proxy
    ```

3. **MySQL Use Case Example**
    To connect to a MySQL server on a remote machine from your local machine, you can forward a local port (3306) to the remote MySQL port (3306) using socat.
    ```bash
    docker run -e SOURCE_PORT=3306 -e DEST_PORT=3306 -e DEST_IP=192.168.1.100 socat-proxy
    ```
    With the proxy running, you can now connect to MySQL as if it were running on your local machine:
    ```bash
    mysql -h 127.0.0.1 -P 3306 -u your_username -p
    ```
    This command connects to the MySQL server on 192.168.1.100:3306 through the local port 3306, allowing you to work with the remote MySQL instance as if it were local.