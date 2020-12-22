package models;

import java.sql.Date;
import java.sql.Timestamp;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.Lob;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;

@Table(name = "monies")
@NamedQueries({
    @NamedQuery(
            name = "getAllMonies",
            query = "SELECT m FROM Money AS m ORDER BY m.id DESC"
            ),
    @NamedQuery(
            name = "getMoniesCount",
            query = "SELECT COUNT(m) FROM Money AS m"
            ),
})
@Entity

public class Money {
    @Id
    @Column(name = "id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @ManyToOne
    @JoinColumn(name = "user_id", nullable = false)
    private User user;

    @Column(name = "money_date", nullable = false)
    private Date money_date;

    @Lob
    @Column(name = "content", nullable = false)
    private String content;

    @Column(name = "create_at", nullable = false)
    private Timestamp created_at;

    @Column(name ="update_at", nullable = false)
    private Timestamp updated_at;

    @Column(name = "deposit", nullable = false)
    private Integer deposit;

    @Column(name = "pay", nullable = false)
    private Integer pay;

    @Column(name = "sum", nullable = false)
    private Integer sum;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Date getMoney_date() {
        return money_date;
    }

    public void setMoney_date(Date money_date) {
        this.money_date = money_date;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Timestamp getCreated_at() {
        return created_at;
    }

    public void setCreated_at(Timestamp created_at) {
        this.created_at = created_at;
    }

    public Timestamp getUpdated_at() {
        return updated_at;
    }

    public void setUpdated_at(Timestamp updated_at) {
        this.updated_at = updated_at;
    }

    public Integer getDeposit(){
        return deposit;
    }

    public void Deposit(Integer deposit){
        this.deposit = deposit;
    }

    public Integer getPay(){
        return pay;
    }

    public void Pay(Integer pay){
    this.pay = pay;
    }

    public Integer getSum() {
        return sum;
    }

    public void Sum(Integer sum){
        this.sum = sum;
    }


}
