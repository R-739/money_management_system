package controllers.monies;

import java.io.IOException;
import java.sql.Date;
import java.sql.Timestamp;
import java.util.List;

import javax.persistence.EntityManager;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import models.Money;
import models.validators.MoneyValidator;
import utils.DBUtil;

/**
 * Servlet implementation class MoniesUpdateServlet
 */
@WebServlet("/monies/update")
public class MoniesUpdateServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public MoniesUpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // TODO Auto-generated method stub
        String _token = (String)request.getParameter("_token");
        if(_token != null && _token.equals(request.getSession().getId())) {
            EntityManager em = DBUtil.createEntityManager();

            Money m = em.find(Money.class, (Integer)(request.getSession().getAttribute("money_id")));


            m.setMoney_date(Date.valueOf(request.getParameter("money_date")));

            m.setContent(request.getParameter("content"));

            m.setDeposit(request.getParameter("deposit"));

            m.setPay(request.getParameter("pay"));

            m.setSum(request.getParameter("sum"));


            m.setUpdated_at(new Timestamp(System.currentTimeMillis()));

            List<String> errors = MoneyValidator.validate(m);
            if(errors.size() > 0) {
                em.close();

                request.setAttribute("_token", request.getSession().getId());
                request.setAttribute("money", m);
                request.setAttribute("errors", errors);

                RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/monies/edit.jsp");
                rd.forward(request, response);
            } else {
                em.getTransaction().begin();
                em.getTransaction().commit();
                em.close();
                request.getSession().setAttribute("flush", "更新が完了しました。");

                request.getSession().removeAttribute("money_id");

                response.sendRedirect(request.getContextPath() + "/monies/index");
            }
        }
    }

}
