<%@ Page Title="" Language="C#" MasterPageFile="~/UAuctionMasterPage.master" AutoEventWireup="true" CodeFile="category.aspx.cs" Inherits="category" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="content-wrapper">
        <br />
        <h4 class="title-style1"><asp:Literal runat="server" ID="ltrheader"></asp:Literal><div class="title-block"></div>
        </h4>
        <div class="woocommerce columns-4">
            <ul class="shop-products products clearfix">
                <asp:Literal runat="server" ID="ltrcontent"></asp:Literal>
                <%--<li class="post-29 product type-product status-publish has-post-thumbnail first sale featured shipping-taxable purchasable product-type-simple product-cat-bath product-cat-moisturisers instock">

                    <a href="product/summer-berry-soap-4/index.html" class="product-link">

                        
                        <img src="furniture1.jpg" class="attachment-shop_catalog wp-post-image" alt="image1" />
                        <p class="product-title">Brown Leather chair</p>
                    </a>

                    <div class="add-to-cart-wrapper">
                        <p class="product-price">
                            <del><span class="amount">&#8377;11.99</span></del> <ins><span class="amount">&#8377;8.99</span></ins>
                        </p>
                        <p class="add-to-cart-button">
                            <a href="indexada1.html?add-to-cart=29" rel="nofollow" data-product_id="29" data-product_sku="" data-quantity="1" class="add_to_cart_button simple">Add to cart +</a>
                        </p>
                    </div>

                    

                </li>

                <li class="post-28 product type-product status-publish has-post-thumbnail sale featured shipping-taxable purchasable product-type-simple product-cat-bath product-cat-moisturisers instock">

                    <a href="product/seaweed-soap-3/index.html" class="product-link">

                        
                        <img src="furniture2.jpg" class="attachment-shop_catalog wp-post-image" alt="image4" />
                        <p class="product-title">cuison chair</p>
                    </a>

                    <div class="add-to-cart-wrapper">
                        <p class="product-price">
                            <del><span class="amount">&#8377;11.99</span></del> <ins><span class="amount">&#8377;8.99</span></ins>
                        </p>
                        <p class="add-to-cart-button">
                            <a href="indexa598.html?add-to-cart=28" rel="nofollow" data-product_id="28" data-product_sku="" data-quantity="1" class="add_to_cart_button simple">Add to cart +</a>
                        </p>
                    </div>

                    </a>

                </li>

                <li class="post-27 product type-product status-publish has-post-thumbnail sale featured shipping-taxable purchasable product-type-simple product-cat-bath product-cat-moisturisers instock">

                    <a href="product/oak-candle-set-3/index.html" class="product-link">

                        
                        <img src="jewellry1.jpg" class="attachment-shop_catalog wp-post-image" alt="image3" />
                        <p class="product-title">Pearl bangles</p>
                    </a>

                    <div class="add-to-cart-wrapper">
                        <p class="product-price">
                            <del><span class="amount">&#8377;16.99</span></del> <ins><span class="amount">&#8377;12.99</span></ins>
                        </p>
                        <p class="add-to-cart-button">
                            <a href="index6379.html?add-to-cart=27" rel="nofollow" data-product_id="27" data-product_sku="" data-quantity="1" class="add_to_cart_button simple">Add to cart +</a>
                        </p>
                    </div>

                    </a>

                </li>

                <li class="post-26 product type-product status-publish has-post-thumbnail last sale featured shipping-taxable purchasable product-type-simple product-cat-bath product-cat-moisturisers instock">

                    <a href="product/seaweed-spa-set-3/index.html" class="product-link">

                        
                        <img src="art1.jpg" class="attachment-shop_catalog wp-post-image" alt="image2" />
                        <p class="product-title">Optimist rose art</p>
                    </a>

                    <div class="add-to-cart-wrapper">
                        <p class="product-price">
                            <del><span class="amount">&#8377;6.99</span></del> <ins><span class="amount">&#8377;4.99</span></ins>
                        </p>
                        <p class="add-to-cart-button">
                            <a href="indexcac1.html?add-to-cart=26" rel="nofollow" data-product_id="26" data-product_sku="" data-quantity="1" class="add_to_cart_button simple">Add to cart +</a>
                        </p>
                    </div>

                    </a>

                </li>--%>

            </ul>
        </div>
    </div>
</asp:Content>

