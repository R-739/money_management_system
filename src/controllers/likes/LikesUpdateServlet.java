package controllers.likes;

import java.io.IOException;

import javax.persistence.EntityManager;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import models.Money;
import utils.DBUtil;

/**
 * Servlet implementation class LikesUpdateServlet
 */
@WebServlet("/likes/update")
public class LikesUpdateServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public LikesUpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // TODO Auto-generated method stub
        String _token = (String) request.getParameter("_token");
        if(_token != null && _token.equals(request.getSession().getId())) {
            EntityManager em = DBUtil.createEntityManager();


            Money m = em.find(Money.class, (Integer) (request.getSession().getAttribute("money_id")));

            m.setLikes(Integer.parseInt(request.getParameter("likes")) + m.getLikes());

            em.getTransaction().begin();
            em.getTransaction().commit();
            em.close();
            request.getSession().setAttribute("flush", "Goodしました");

            request.getSession().removeAttribute("money_id");

            response.sendRedirect(request.getContextPath() + "/monies/index");

        }
    }

}
