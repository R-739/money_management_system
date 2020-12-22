package controllers.monies;

import java.io.IOException;
import java.util.List;

import javax.persistence.EntityManager;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import models.Money;
import utils.DBUtil;

/**
 * Servlet implementation class MoniesIndexServlet
 */
@WebServlet("/monies/index")
public class MoniesIndexServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public MoniesIndexServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // TODO Auto-generated method stub
        EntityManager em = DBUtil.createEntityManager();

        int page;
        try{
            page = Integer.parseInt(request.getParameter("page"));
        } catch(Exception e) {
            page = 1;
        }
        List<Money> monies = em.createNamedQuery("getAllMonies", Money.class)
                            .setFirstResult(15 * (page -1))
                            .setMaxResults(15)
                            .getResultList();

        long monies_count = (long)em.createNamedQuery("getMoniesCount", Long.class)
                            .getSingleResult();


        em.close();

        request.setAttribute("monies", monies);
        request.setAttribute("monies_count", monies_count);
        request.setAttribute("page", page);
        if(request.getSession().getAttribute("flush") != null) {
            request.setAttribute("flush", request.getSession().getAttribute("flush"));
            request.getSession().removeAttribute("flush");
        }

        RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/monies/index.jsp");
        rd.forward(request, response);

    }

}
