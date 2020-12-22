package controllers.monies;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import models.Money;

/**
 * Servlet implementation class MoniesNewServlet
 */
@WebServlet("/monies/new")
public class MoniesNewServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public MoniesNewServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // TODO Auto-generated method stub
        request.setAttribute("_token", request.getSession().getId());

        Money m = new Money();
        m.setMoney_date(new Date(System.currentTimeMillis()));
        request.setAttribute("money", m);

        RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/monies/new.jsp");
        rd.forward(request, response);

    }

}
