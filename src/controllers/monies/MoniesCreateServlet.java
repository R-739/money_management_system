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
import models.User;
import models.validators.MoneyValidator;
import utils.DBUtil;

/**
 * Servlet implementation class MoniesCreateServlet
 */
@WebServlet("/monies/create")
public class MoniesCreateServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public MoniesCreateServlet() {
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

            Money m = new Money();

            m.setUser((User)request.getSession().getAttribute("login_user"));


            Date money_date = new Date(System.currentTimeMillis());
            String rd_str = request.getParameter("money_date");
            if(rd_str != null && !rd_str.equals("")) {
                money_date = Date.valueOf(request.getParameter("money_date"));
            }
            m.setMoney_date(money_date);

            m.setContent(request.getParameter("content"));

            m.setDeposit(request.getParameter("deposit"));

            m.setPay(request.getParameter("pay"));

            m.setSum(request.getParameter("sum"));

            m.setLikes(0);

            m.setDislikes(0);

            Timestamp currentTime = new Timestamp(System.currentTimeMillis());
            m.setCreated_at(currentTime);
            m.setUpdated_at(currentTime);

            List<String> errors = MoneyValidator.validate(m);
            if(errors.size() > 0) {
                em.close();

                request.setAttribute("_token", request.getSession().getId());
                request.setAttribute("money", m);
                request.setAttribute("errors", errors);

                RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/monies/new.jsp");
                rd.forward(request, response);
            } else {
                em.getTransaction().begin();
                em.persist(m);
                em.getTransaction().commit();
                em.close();
                request.getSession().setAttribute("flush", "登録が完了しました。");

                response.sendRedirect(request.getContextPath() + "/monies/index");
            }



        }
    }

}
