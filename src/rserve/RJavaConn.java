package rserve;

import org.rosuda.REngine.REXP;
import org.rosuda.REngine.REXPMismatchException;
import org.rosuda.REngine.Rserve.RConnection;
import org.rosuda.REngine.Rserve.RserveException;

public class RJavaConn {

    public static void main(String[] args) throws RserveException, REXPMismatchException {
        RJavaConn demo = new RJavaConn();
        demo.callRserve();
    }

    public void callRserve() throws RserveException, REXPMismatchException {
        RConnection rconn = new RConnection("127.0.0.1");
        REXP x = rconn.eval("R.version.string");
        System.out.println(x.asString());//打印变量x

        double[] arr = rconn.eval("rnorm(10)").asDoubles();
        for (double a : arr) {//循环打印变量arr
            System.out.print(a + ",");
        }
    }
}

