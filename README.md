# MapleVM

Boot a vm with pre-built maple system, gui and demo code.

## Install and Start VM

To install and start maple vm, you need to install [vagrant](https://www.vagrantup.com) and [VirtualBox](https://www.virtualbox.org/wiki/Downloads). And then follow these commands:

```sh
$ git clone https://github.com/snlab/MapleVM.git
$ cd MapleVM
$ vagrant up
```

## Try the Demo

After start maple vm, a virtualbox display window will pop up automatically. And the demo and related environment have been prepared well.

1. Start three terminal in the vm.

    Ubuntu 14.04 LTS Desktop has been installed in the vm. To try the demo, you need to open 3 terminal to start OpenDaylight with Maple, Web UI and Mininet.

2. Start OpenDaylight with Maple system.

    ```sh
    $ ./maple/assembly/bin/karaf
    ```

    You may wait for a few minutes until Maple system completes the initiation. (You will see a "Maple Start" message.)

3. Start Web UI for Maple.

    ```sh
    $ cd maple/MapleGUI/dist
    $ node server.js
    ```

    After that, you can open your web browser and access the url http://localhost:3000/maple/maple.html

4. Start mininet and connect to the OpenDaylight controller.

    ```sh
    $ cd ~/maple/MapleDemo/onlineStreaming
    $ sudo mn --custom ./topo3switches.py --topo mytopo --controller=remote,ip=127.0.0.1 --mac
    ```

    You will start a mininet and connect to your local OpenDaylight controller.

    ```sh
    (In mininet consolea)
    mininet> h2 ./server-http.sh ../sample.mp4 &
    mininet> h2 ./client-http.sh &
    ```

5. Check how Maple choice the shortest path for streaming connections:

    ```sh
    (In mininet console)
    mininet> sh ovs-ofctl dump-flows s1
    (In Maple GUI) Check tabs topology and flow-tables
    ```

6. Simulate a link failure:

    ```sh
    (In mininet console)
    mininet> link s2 s3 down
    ```

7. Check how Maple do a user-oblivious reroute: 

    ```sh
    (Video continues in the client)
    (In Maple GUI) Check tabs topology and flow-tables. The connection has been rerouted to bypasses link s2 <-> s3.
    ```

8. Simulate the link goes back:

    ```sh
    (In mininet console)
    mininet> link s2 s3 up 
    (In Maple GUI) Check tabs topology and flow-tables. The connection has been rerouted to use shortest path s2 <-> s3.
    ```

