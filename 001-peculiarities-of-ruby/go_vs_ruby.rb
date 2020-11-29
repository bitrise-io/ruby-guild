# This is a perfectly valid - albeit not very Ruby-like - Ruby function
# It's actually the code of one of the API endpoints in the Payment Service (with minor modifications)

def AccountGetHandler(c)
  ctx = MustFetchAppContext(c)

  paymentID = ctx.Param("payment_id")
  acc, err = findAccount(paymentID, ctx.Services)
  if err != nil
    return err
  end

  if acc == nil
    ctx.Zap.Warn("Account not found")
    return ctx.JSON(http.StatusNotFound, StandardErrorResponse.with({Message: "Not Found"}))
  end

  sub, err = ctx.Services.SubscriptionService.Find(models.Subscription.with({AccountID: acc.ID}))
  if err != nil
    return err
  end

  return c.JSON(http.StatusOK, AccountGetResponse.with({
    Account:      acc,
    Subscription: sub,
  }))
end
