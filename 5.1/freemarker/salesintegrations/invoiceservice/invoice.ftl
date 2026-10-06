<#-- Invoice template: rendered by GET /invoices/{cartId} with the cart JSON as data. -->
<#-- .ftlh = HTML output format, so every ${...} below is HTML-escaped automatically. -->
<#assign savings = total - discountedTotal>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <title>Invoice #${id}</title>
  <style>
    body { font-family: -apple-system, "Segoe UI", Roboto, sans-serif; background: #f4f5f7; color: #1f2933; margin: 0; padding: 40px 16px; }
    .invoice { max-width: 760px; margin: 0 auto; background: #fff; border-radius: 12px; box-shadow: 0 4px 24px rgba(0,0,0,.08); overflow: hidden; }
    header { background: #ff7300; color: #fff; padding: 28px 32px; display: flex; justify-content: space-between; align-items: flex-end; }
    header h1 { margin: 0; font-size: 28px; }
    header .meta { text-align: right; font-size: 14px; opacity: .9; }
    .savings { margin: 24px 32px 0; padding: 14px 18px; background: #e8f7ee; color: #116b3a; border-radius: 8px; font-weight: 600; }
    table { width: calc(100% - 64px); margin: 24px 32px; border-collapse: collapse; font-size: 15px; }
    th { text-align: left; font-size: 12px; text-transform: uppercase; letter-spacing: .05em; color: #7b8794; border-bottom: 2px solid #e4e7eb; padding: 10px 8px; }
    td { padding: 12px 8px; border-bottom: 1px solid #f0f2f4; vertical-align: middle; }
    td.num, th.num { text-align: right; }
    .item { display: flex; align-items: center; gap: 12px; }
    .item img { width: 44px; height: 44px; object-fit: cover; border-radius: 6px; background: #f4f5f7; }
    .badge { display: inline-block; margin-left: 6px; padding: 2px 8px; border-radius: 999px; background: #fff1e6; color: #c25400; font-size: 12px; font-weight: 600; }
    .totals { margin: 0 32px 32px auto; width: 300px; font-size: 15px; }
    .totals div { display: flex; justify-content: space-between; padding: 6px 0; }
    .totals .grand { border-top: 2px solid #1f2933; margin-top: 6px; padding-top: 10px; font-size: 20px; font-weight: 700; }
    footer { padding: 18px 32px; background: #f9fafb; color: #7b8794; font-size: 13px; }
  </style>
</head>
<body>
  <div class="invoice">
    <header>
      <div>
        <h1>Invoice #${id}</h1>
        <div>Customer #${userId}</div>
      </div>
      <div class="meta">
        ${totalProducts} products &middot; ${totalQuantity} items
      </div>
    </header>

    <#if savings gt 0>
    <div class="savings">You saved $${savings?string(",##0.00")} on this order.</div>
    </#if>

    <table>
      <thead>
        <tr><th>Item</th><th class="num">Price</th><th class="num">Qty</th><th class="num">Amount</th></tr>
      </thead>
      <tbody>
      <#list products as p>
        <tr>
          <td>
            <div class="item">
              <img src="${p.thumbnail!""}" alt="">
              <span>
                ${p.title}
                <#if p.discountPercentage gt 10><span class="badge">${p.discountPercentage?string("0")}% off</span></#if>
              </span>
            </div>
          </td>
          <td class="num">$${p.price?string(",##0.00")}</td>
          <td class="num">${p.quantity}</td>
          <td class="num">$${p.discountedTotal?string(",##0.00")}</td>
        </tr>
      <#else>
        <tr><td colspan="4">This cart is empty.</td></tr>
      </#list>
      </tbody>
    </table>

    <div class="totals">
      <div><span>Subtotal</span><span>$${total?string(",##0.00")}</span></div>
      <div><span>Discounts</span><span>-$${savings?string(",##0.00")}</span></div>
      <div class="grand"><span>Total due</span><span>$${discountedTotal?string(",##0.00")}</span></div>
    </div>

    <footer>Thank you for your order! Questions? Contact support@example.com.</footer>
  </div>
</body>
</html>

