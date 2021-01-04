<%@ Page Title="" Language="C#" MasterPageFile="~/UAuctionMasterPage.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="slider-wrapper ">
        <div class="slider-navigation">
            <a class="arrow-left" href="#"></a>
            <a class="arrow-right" href="#"></a>
        </div>
        <div class="swiper-container">
            <div class="swiper-wrapper">

                <div class="swiper-slide qns-slide-1">
                    <div class="slider-caption-wrapper">
                        <div class="slider-caption">
                            <p class="colour-caption1 large-caption">Auction at your Finguretips</p>

                            <div class="clearboth"></div>

                            <%--<p class="colour-caption2 large-caption">A Beautiful WooCommerce Theme</p>--%>
                        </div>
                    </div>
                </div>
                <div class="swiper-slide qns-slide-2">
                    <div class="slider-caption-wrapper">
                        <div class="slider-caption">
                            <%--<p class="colour-caption1 large-caption">Easy To Customize Colour Scheme</p>--%>

                            <div class="clearboth"></div>

                            <%--<p class="colour-caption2 large-caption">All CSS Code For Coloured Elements Stored Separately</p>--%>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="pagination"></div>
        <!-- END .slider-wrapper -->
    </div>
    <div class="content-wrapper">
        <h4 class="title-style1">Featured Products<div class="title-block"></div>
        </h4>
        <div class="woocommerce columns-4">
            <ul class="shop-products products clearfix">

                <li class="post-29 product type-product status-publish has-post-thumbnail first sale featured shipping-taxable purchasable product-type-simple product-cat-bath product-cat-moisturisers instock">

                    <a href="product/summer-berry-soap-4/index.html" class="product-link">

                        <%--<span class="onsale-ns">Sale!</span>--%>
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

                    </a>

                </li>

                <li class="post-28 product type-product status-publish has-post-thumbnail sale featured shipping-taxable purchasable product-type-simple product-cat-bath product-cat-moisturisers instock">

                    <a href="product/seaweed-soap-3/index.html" class="product-link">

                        <%--<span class="onsale-ns">Sale!</span>--%>
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

                        <%--<span class="onsale-ns">Sale!</span>--%>
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

                        <%--<span class="onsale-ns">Sale!</span>--%>
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

                </li>

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
        <%--<ul class="columns-wrapper clearfix">
                    <div class="one-third">
                        <h4 class="title-style1">Popular Products<div class="title-block"></div></h4>
                        <ul class="vertical-products">
                            <li class="clearfix">
                                <a href="product/summer-berry-soap-4/index.html">
                                    <img class="product-image" src="wp-content/uploads/2015/04/image14-300x300.jpg" alt="" />
                                </a>
                                <div class="product-info">
                                    <h4>
                                        <a href="product/summer-berry-soap-4/index.html"> Summer Berry Soap</a>
                                    </h4>
                                    <p class="product-cats">
                                        <span class="posted_in"></span><a href="product-category/bath/index.html" rel="tag">Bath</a>, <a href="product-category/moisturisers/index.html" rel="tag">Moisturisers</a>
                                    </p><del><span class="amount">&pound;11.99</span></del> <ins><span class="amount">&pound;8.99</span></ins>
                                </div>
                            </li>
                            <li class="clearfix">
                                <a href="product/summer-berry-soap-3/index.html">
                                    <img class="product-image" src="wp-content/uploads/2015/04/image14-300x300.jpg" alt="" />
                                </a>
                                <div class="product-info">
                                    <h4>
                                        <a href="product/summer-berry-soap-3/index.html"> Summer Berry Soap</a>
                                    </h4>
                                    <p class="product-cats">
                                        <span class="posted_in"></span><a href="product-category/bath/index.html" rel="tag">Bath</a>, <a href="product-category/fragrance/index.html" rel="tag">Fragrance</a>
                                    </p><del><span class="amount">&pound;11.99</span></del> <ins><span class="amount">&pound;8.99</span></ins>
                                </div>
                            </li>
                            <li class="clearfix">
                                <a href="product/seaweed-soap-3/index.html">
                                    <img class="product-image" src="wp-content/uploads/2015/04/image44-300x300.jpg" alt="" />
                                </a>
                                <div class="product-info">
                                    <h4>
                                        <a href="product/seaweed-soap-3/index.html"> Seaweed Soap</a>
                                    </h4>
                                    <p class="product-cats">
                                        <span class="posted_in"></span><a href="product-category/bath/index.html" rel="tag">Bath</a>, <a href="product-category/moisturisers/index.html" rel="tag">Moisturisers</a>
                                    </p><del><span class="amount">&pound;11.99</span></del> <ins><span class="amount">&pound;8.99</span></ins>
                                </div>
                            </li>
                        </ul>
                    </div>
                    <div class="one-third">
                        <h4 class="title-style1">Top Rated Products<div class="title-block"></div></h4>
                        <ul class="vertical-products">
                            <li class="clearfix">
                                <a href="product/oak-candle-set-3/index.html">
                                    <img class="product-image" src="wp-content/uploads/2015/04/image34-300x300.jpg" alt="" />
                                </a>
                                <div class="product-info">
                                    <h4>
                                        <a href="product/oak-candle-set-3/index.html"> Oak Candle Set</a>
                                    </h4>
                                    <p class="product-cats">
                                        <span class="posted_in"></span><a href="product-category/bath/index.html" rel="tag">Bath</a>, <a href="product-category/moisturisers/index.html" rel="tag">Moisturisers</a>
                                    </p><del><span class="amount">&pound;16.99</span></del> <ins><span class="amount">&pound;12.99</span></ins>
                                </div>
                            </li>
                            <li class="clearfix">
                                <a href="product/summer-berry-soap-3/index.html">
                                    <img class="product-image" src="wp-content/uploads/2015/04/image14-300x300.jpg" alt="" />
                                </a>
                                <div class="product-info">
                                    <h4>
                                        <a href="product/summer-berry-soap-3/index.html"> Summer Berry Soap</a>
                                    </h4>
                                    <p class="product-cats">
                                        <span class="posted_in"></span><a href="product-category/bath/index.html" rel="tag">Bath</a>, <a href="product-category/fragrance/index.html" rel="tag">Fragrance</a>
                                    </p><del><span class="amount">&pound;11.99</span></del> <ins><span class="amount">&pound;8.99</span></ins>
                                </div>
                            </li>
                            <li class="clearfix">
                                <a href="product/summer-berry-soap-2/index.html">
                                    <img class="product-image" src="wp-content/uploads/2015/04/image14-300x300.jpg" alt="" />
                                </a>
                                <div class="product-info">
                                    <h4>
                                        <a href="product/summer-berry-soap-2/index.html"> External/Affiliate Product</a>
                                    </h4>
                                    <p class="product-cats">
                                        <span class="posted_in"></span><a href="product-category/hair/index.html" rel="tag">Hair</a>, <a href="product-category/make-up/index.html" rel="tag">Make-Up</a>
                                    </p><del><span class="amount">&pound;11.99</span></del> <ins><span class="amount">&pound;8.99</span></ins>
                                </div>
                            </li>
                        </ul>
                    </div>
                    <div class="one-third last-col">
                        <h4 class="title-style1">On Sale Products<div class="title-block"></div></h4>
                        <ul class="vertical-products">
                            <li class="clearfix">
                                <a href="product/seaweed-soap-4/index.html">
                                    <img class="product-image" src="wp-content/uploads/2015/04/image44-300x300.jpg" alt="" />
                                </a>
                                <div class="product-info">
                                    <h4>
                                        <a href="product/seaweed-soap-4/index.html"> Seaweed Soap</a>
                                    </h4>
                                    <p class="product-cats">
                                        <span class="posted_in"></span><a href="product-category/gift/index.html" rel="tag">Gift</a>, <a href="product-category/skin-care/index.html" rel="tag">Skin Care</a>
                                    </p><del><span class="amount">&pound;11.99</span></del> <ins><span class="amount">&pound;8.99</span></ins>
                                </div>
                            </li>
                            <li class="clearfix">
                                <a href="product/oak-candle-set-4/index.html">
                                    <img class="product-image" src="wp-content/uploads/2015/04/image34-300x300.jpg" alt="" />
                                </a>
                                <div class="product-info">
                                    <h4>
                                        <a href="product/oak-candle-set-4/index.html"> Oak Candle Set</a>
                                    </h4>
                                    <p class="product-cats">
                                        <span class="posted_in"></span><a href="product-category/gift/index.html" rel="tag">Gift</a>, <a href="product-category/skin-care/index.html" rel="tag">Skin Care</a>
                                    </p><del><span class="amount">&pound;16.99</span></del> <ins><span class="amount">&pound;12.99</span></ins>
                                </div>
                            </li>
                            <li class="clearfix">
                                <a href="product/seaweed-spa-set-4/index.html">
                                    <img class="product-image" src="wp-content/uploads/2015/04/image24-300x300.jpg" alt="" />
                                </a>
                                <div class="product-info">
                                    <h4>
                                        <a href="product/seaweed-spa-set-4/index.html"> Seaweed Spa Set</a>
                                    </h4>
                                    <p class="product-cats">
                                        <span class="posted_in"></span><a href="product-category/gift/index.html" rel="tag">Gift</a>, <a href="product-category/skin-care/index.html" rel="tag">Skin Care</a>
                                    </p><del><span class="amount">&pound;6.99</span></del> <ins><span class="amount">&pound;4.99</span></ins>
                                </div>
                            </li>
                        </ul>
                    </div>
                </ul>
                <section class="s-newsletter">
                    <div class="newsletter-wrapper clearfix">
                        <h3 class="newsletter-text">Sign up for the Natural Shop newsletter for exclusive deals</h3>
                        <!-- Form by Newsletter Sign-Up v2.0.5 - https://wordpress.org/plugins/newsletter-sign-up/ -->
                        <form class="nsu-form" id="nsu-form-0" action="#" method="post"><p><label for="nsu-email-0">Email:</label><input class="nsu-field" id="nsu-email-0" type="email" name="" placeholder="Your email address.." required /></p><textarea name="nsu_robocop" style="display: none;"></textarea><p><input type="submit" id="nsu-submit-0" class="nsu-submit" name="nsu_submit" value="Sign up" /></p></form>
                        <!-- / Newsletter Sign-Up -->
                    </div>
                </section>--%>
        <h4 class="title-style1">Testimonials<div class="title-block"></div>
        </h4>
        <div class="text-slider-wrapper">
            <div class="text-slider">
                <ul class="slides">
                    <li>
                        <div class="large-quote-wrapper">
                            <blockquote><span class="quoteopen">&ldquo;</span>We have become not a melting pot but a beautiful mosaic. Different people, different beliefs, different yearnings, different hopes, different dreams." <span class="quoteclose">&rdquo;</span></blockquote>
                            <p class="quoteauthor"><span>Jimmy Carter -</span></p>
                        </div>
                    </li>
                    <li>
                        <div class="large-quote-wrapper">
                            <blockquote><span class="quoteopen">&ldquo;</span>But good healthy communication is impossible without openness, honesty, and vulnerability." <span class="quoteclose">&rdquo;</span></blockquote>
                            <p class="quoteauthor"><span>Paul Kendall -</span></p>
                        </div>
                    </li>
                    <li>
                        <div class="large-quote-wrapper">
                            <blockquote><span class="quoteopen">&ldquo;</span>"Be kind to strangers, because it's the loving thing to do. Also, you never know - they could be angels. <span class="quoteclose">&rdquo;</span></blockquote>
                            <p class="quoteauthor"><span>Scott Curran-</span></p>
                        </div>
                    </li>
                </ul>
            </div>
        </div>
    </div>

</asp:Content>

