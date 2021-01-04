<%@ Page Title="" Language="C#" MasterPageFile="~/UAuctionMasterPage.master" AutoEventWireup="true" CodeFile="Auction.aspx.cs" Inherits="Auction" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="content-wrapper">
        <h4 class="title-style1">Today's Auction<div class="title-block"></div>
        </h4>
        <div class="woocommerce columns-4">
            <ul class="shop-products products clearfix">
                <asp:Literal runat="server" ID="ltrtoday"></asp:Literal>
                <%--<li class="post-29 product type-product status-publish has-post-thumbnail first sale featured shipping-taxable purchasable product-type-simple product-cat-bath product-cat-moisturisers instock">

                    <a href="product/summer-berry-soap-4/index.html" class="product-link">

                        <span class="onsale-ns">Sale!</span>
                        <img src="wp-content/uploads/2015/04/image14-300x300.jpg" class="attachment-shop_catalog wp-post-image" alt="image1" />
                        <p class="product-title">Summer Berry Soap</p>
                    </a>

                    <div class="add-to-cart-wrapper">
                        <p class="product-price">
                            <del><span class="amount">&pound;11.99</span></del> <ins><span class="amount">&pound;8.99</span></ins>
                        </p>
                        <p class="add-to-cart-button">
                            <a href="indexada1.html?add-to-cart=29" rel="nofollow" data-product_id="29" data-product_sku="" data-quantity="1" class="add_to_cart_button simple">Add to cart +</a>
                        </p>
                    </div>

                    

                </li>--%>

                

                

                


            </ul>
        </div>
        <%--<ul class="link-blocks clearfix">
                    <li>
                        <h3>
                            <a class="link-block-2" href="#">
                                <span class="link-text">Free delivery on all orders over £50</span>
                                <span class="link-arrow fa fa-angle-right"></span>
                            </a>
                        </h3>
                    </li>
                    <li>
                        <h3>
                            <a class="link-block-2" href="#">
                                <span class="link-text">Our delivery and returns policy</span>
                                <span class="link-arrow fa fa-angle-right"></span>
                            </a>
                        </h3>
                    </li>
                </ul>--%>
        <h4 class="title-style1">Yesterday's Auction<div class="title-block"></div>
        </h4>
        <div class="woocommerce columns-4">
            <ul class="shop-products products clearfix">
                <asp:Literal runat="server" ID="ltryesterday"></asp:Literal>
                <%--<li class="post-29 product type-product status-publish has-post-thumbnail first sale featured shipping-taxable purchasable product-type-simple product-cat-bath product-cat-moisturisers instock">

                    <a href="product/summer-berry-soap-4/index.html" class="product-link">

                        <span class="onsale-ns">Sale!</span>
                        <img src="wp-content/uploads/2015/04/image14-300x300.jpg" class="attachment-shop_catalog wp-post-image" alt="image1" />
                        <p class="product-title">Summer Berry Soap</p>
                    </a>

                    <div class="add-to-cart-wrapper">
                        <p class="product-price">
                            <del><span class="amount">&pound;11.99</span></del> <ins><span class="amount">&pound;8.99</span></ins>
                        </p>
                        <p class="add-to-cart-button">
                            <a href="indexada1.html?add-to-cart=29" rel="nofollow" data-product_id="29" data-product_sku="" data-quantity="1" class="add_to_cart_button simple">Add to cart +</a>
                        </p>
                    </div>


                </li>--%>

                


            </ul>
        </div>
    </div>
</asp:Content>

