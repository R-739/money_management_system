package models.validators;

import java.util.ArrayList;
import java.util.List;

import models.Money;

public class MoneyValidator {
    public static List<String> validate(Money m) {
        List<String> errors = new ArrayList<String>();

        String content_error = _validateContent(m.getContent());
        if(!content_error.equals("")) {
            errors.add(content_error);
        }

        String deposit_error = _validateDeposit(m.getDeposit());
        if(!deposit_error.equals("")) {
            errors.add(deposit_error);
        }

        String pay_error = _validatePay(m.getPay());
        if(!pay_error.equals("")) {
            errors.add(pay_error);
        }


        return errors;
    }

    private static String _validateContent(String content) {
        if(content == null || content.equals("")) {
            return "内容を入力してください。";
        }
        return "";
    }

    private static String _validateDeposit(Integer deposit) {
        if(deposit == null || deposit.equals("")) {
            return "数字を入力してください。";
        }
        return "";

    }

    private static String _validatePay(Integer pay) {
        if(pay == null || pay.equals("")) {
            return "数字を入力してください。";
        }
        return "";
    }

}
