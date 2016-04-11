package upsmart.jetty;

import java.io.File;
import java.lang.management.ManagementFactory;

import org.eclipse.jetty.server.Server;
import org.eclipse.jetty.jmx.MBeanContainer;
import org.eclipse.jetty.webapp.WebAppContext;

public class Main {
    public static void main(String[] args) {
        if (args.length < 1) {
            System.out.println("missing argument: war file path");
            System.exit(0);
        }

        String warPath = args[0];
        int port = 9999;
        try {
            if (args.length > 1) {
                String portStr = args[1];
                port = Integer.parseInt(portStr);
            }
            oneWebApp(warPath, port);
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }

    private static void oneWebApp(String warFilePath, int port) throws Exception {
        Server server = new Server(port);

        // Setup JMX
        MBeanContainer mbContainer = new MBeanContainer(ManagementFactory.getPlatformMBeanServer());
        server.addBean(mbContainer);

        WebAppContext webapp = new WebAppContext();
        webapp.setContextPath("/");
        File warFile = new File(warFilePath);
        webapp.setWar(warFile.getAbsolutePath());

        server.setHandler(webapp);
        server.start();
        server.join();
    }

}
