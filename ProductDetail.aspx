<%@ Page Title="" Language="C#" MasterPageFile="~/UAuctionMasterPage.master" AutoEventWireup="true" CodeFile="ProductDetail.aspx.cs" Inherits="ProductDetail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div id="page-header" style="background: url(../../../naturalshop/images/page-header.jpg) #f1f1f1;">
        <div class="content-wrapper clearfix">
            <h1>Shop</h1>

        </div>
        <!-- END #page-header -->
    </div>
    <div class="content-wrapper clearfix">
        <!-- BEGIN .main-content -->
        <main class="main-content">


                    <div itemscope itemtype="#" id="product-29" class="post-29 product type-product status-publish has-post-thumbnail sale featured shipping-taxable purchasable product-type-simple product-cat-bath product-cat-moisturisers instock">
                        <div class="product-image-single">


                            <span class="onsale-ns">Sale!</span>
                            <asp:Literal runat="server" ID="ltrimg"></asp:Literal>
                            <%--<a href="../../wp-content/uploads/2015/04/image14.jpg" itemprop="image" title="image1" rel="prettyPhoto"><img src="../../wp-content/uploads/2015/04/image14-600x600.jpg" class="attachment-shop_single wp-post-image" alt="image1" title="image1" /></a>--%>

                        </div>
                        <!-- BEGIN .product-description-single -->
                        <div class="product-description-single">
                            <h1 itemprop="name" class="product-title-single"><asp:Literal runat="server" ID="ltrname"></asp:Literal></h1>
                            <div itemprop="offers" itemscope itemtype="http://schema.org/Offer">
                                <h2 class="product-price-single"><span class="amount">&pound;<asp:Literal runat="server" ID="ltrprice"></asp:Literal></span></h2>
                                <meta itemprop="price" content="8.99" />
                                <meta itemprop="priceCurrency" content="GBP" />
                                <link itemprop="availability" href="http://schema.org/InStock" />
                            </div>
                            <div itemprop="description">
                                <p><asp:Literal runat="server" ID="ltrdesc"></asp:Literal></p>
                            </div>


                            <form class="cart" method="post" enctype='multipart/form-data'>

                                <div class="quantity">
                                    <input type="number" name="quantity" value="1" class="input-text text" size="4" /></div>
                                
                                <button type="submit" class="single_add_to_cart_button fl">Bid</button>
                            </form>

                            <div class="product_meta">


                                <span class="posted_in">Categories: 
                                    <asp:Literal runat="server" ID="ltrcategory"></asp:Literal>
                                    <%--<a href="#" rel="tag">Bath</a>--%>

                                </span>


                            </div>

                            <!-- END .product-description-single -->
                        </div>

                        <div class="clearboth"></div>

                        <div id="tabs">
                            <ul class="nav clearfix">

                                <li class="description_tab">
                                    <a href="#tab-description">Description</a>
                                </li>

                                <li class="reviews_tab">
                                    <a href="#tab-reviews">Reviews (0)</a>
                                </li>
                            </ul>

                            <div class="panel entry-content" id="tab-description">

                                <!--   <h2>Product Description</h2>
                                 -->
                                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec id dignissim nisl. Integer tristique aliquet massa, ut sagittis libero tempor pellentesque. Suspendisse sem sem, bibendum sed volutpat eget.</p>
                            </div>

                            <div class="panel entry-content" id="tab-reviews">
                                <div id="reviews">

                                    <!--<h2>Reviews</h2>-->

                                    <p class="woocommerce-noreviews">There are no reviews yet.</p>


                                    <a class="button2" rel="prettyPhoto" href="#add-review-lightbox">Add Review</a>

                                    <!-- BEGIN #add-review-lightbox -->
                                    <%--<div id="add-review-lightbox">

                                        <!-- BEGIN .lightbox-content -->
                                        <div class="lightbox-content main-content">

                                            <!-- BEGIN #review_form -->
                                            <div id="review_form">

                                                <div id="respond" class="comment-respond">
                                                    <h3 id="reply-title" class="comment-reply-title">Be the first to review &ldquo;Summer Berry Soap&rdquo; <small><a rel="nofollow" id="cancel-comment-reply-link" href="index.html#respond" style="display:none;">Cancel reply</a></small></h3>
                                                    <form action="http://themes.quitenicestuff.com/naturalshopwp/wp-comments-post.php" method="post" id="commentform" class="comment-form">
                                                        <p class="comment-form-author"><label for="author">Name <span class="required">*</span></label> <input id="author" name="author" type="text" value="" size="30" aria-required="true" /></p>
                                                        <p class="comment-form-email"><label for="email">Email <span class="required">*</span></label> <input id="email" name="email" type="text" value="" size="30" aria-required="true" /></p>
                                                        <p class="comment-form-rating">
                                                            <label for="rating">Your Rating</label><select name="rating" id="rating">
                                                                <option value="">Rate&hellip;</option>
                                                                <option value="5">Perfect</option>
                                                                <option value="4">Good</option>
                                                                <option value="3">Average</option>
                                                                <option value="2">Not that bad</option>
                                                                <option value="1">Very Poor</option>
                                                            </select>
                                                        </p><p class="comment-form-comment"><label for="comment">Your Review</label><textarea id="comment" name="comment" cols="45" rows="8" aria-required="true"></textarea></p>												<p class="form-submit">
                                                            <input name="submit" type="submit" id="submit" class="submit" value="Add Review" />
                                                            <input type='hidden' name='comment_post_ID' value='29' id='comment_post_ID' />
                                                            <input type='hidden' name='comment_parent' id='comment_parent' value='0' />
                                                        </p>
                                                        <!-- Checkbox by Newsletter Sign-Up Checkbox v2.0.5 - https://wordpress.org/plugins/newsletter-sign-up/ -->
                                                        <p id="nsu-checkbox">
                                                            <label for="nsu-checkbox-input" id="nsu-checkbox-label">
                                                                <input value="1" id="nsu-checkbox-input" type="checkbox" name="newsletter-sign-up-do" />
                                                                Sign me up for the newsletter
                                                            </label>
                                                        </p>
                                                        <!-- / Newsletter Sign-Up -->
                                                    </form>
                                                </div><!-- #respond -->
                                                <!-- END #review_form -->
                                            </div>

                                            <!-- END .lightbox-content -->
                                        </div>

                                        <!-- END #add-review-lightbox -->
                                    </div>--%>

                                    <div class="clear"></div>
                                </div>
                            </div>
                        </div>

                        <%--<div class="related products">

                            <h4 class="title-style3">
                                Related Products			<span class="title-block"></span>
                            </h4>

                            <div class="columns-4">
                                <ul class="shop-products products clearfix">

                                    <li class="post-13 product type-product status-publish has-post-thumbnail first sale shipping-taxable purchasable product-type-simple product-cat-gift product-cat-moisturisers outofstock">

                                        <a href="../summer-berry-soap/index.html" class="product-link">

                                            <span class="onsale-ns">Sale!</span>
                                            <img src="../../wp-content/uploads/2015/04/image14-300x300.jpg" class="attachment-shop_catalog wp-post-image" alt="image1" />		<p class="product-title">Out of Stock Product</p>
                                        </a>

                                        <div class="star-rating" title="Rated 4.50 out of 5"><span style="width:90%"><strong class="rating">4.50</strong> out of 5</span></div>
                                        <div class="add-to-cart-wrapper">
                                            <p class="product-price">
                                                <del><span class="amount">&pound;11.99</span></del> <ins><span class="amount">&pound;8.99</span></ins>
                                            </p>
                                            <p class="add-to-cart-button">
                                                <a href="../summer-berry-soap/index.html" rel="nofollow" data-product_id="13" data-product_sku="" data-quantity="1" class=" simple">Read More +</a>
                                            </p>
                                        </div>

                                        </a>

                                    </li>

                                    <li class="post-28 product type-product status-publish has-post-thumbnail last sale featured shipping-taxable purchasable product-type-simple product-cat-bath product-cat-moisturisers instock">

                                        <a href="../seaweed-soap-3/index.html" class="product-link">

                                            <span class="onsale-ns">Sale!</span>
                                            <img src="../../wp-content/uploads/2015/04/image44-300x300.jpg" class="attachment-shop_catalog wp-post-image" alt="image4" />		<p class="product-title">Seaweed Soap</p>
                                        </a>

                                        <div class="add-to-cart-wrapper">
                                            <p class="product-price">
                                                <del><span class="amount">&pound;11.99</span></del> <ins><span class="amount">&pound;8.99</span></ins>
                                            </p>
                                            <p class="add-to-cart-button">
                                                <a href="indexa598.html?add-to-cart=28" rel="nofollow" data-product_id="28" data-product_sku="" data-quantity="1" class="add_to_cart_button simple">Add to cart +</a>
                                            </p>
                                        </div>

                                        </a>

                                    </li>

                                </ul>
                            </div>

                        </div>--%>

                        <meta itemprop="url" content="index.html" />
                    </div><!-- #product-29 -->
                    <!-- END .main-content -->
                </main>

        <!-- BEGIN .sidebar-content -->

        <aside class="sidebar-content">


            <!-- BEGIN .widget -->
            <section class="widget clearfix">

                <!-- BEGIN .sidebar-no-list-style -->
                <div class="sidebar-no-list-style">

                    <h4 class="title-style3">Biding<span class="title-block"></span>
                    </h4>

                    <ul class="product-widget">

                        <asp:Literal runat="server" ID="ltrbiding"></asp:Literal>
                        <%--<li class="post-19 product type-product status-publish has-post-thumbnail clearfix sale downloadable virtual shipping-taxable purchasable product-type-simple product-cat-gift product-cat-hair instock">

                            <div class="product-description-widget">

                                <h4>Digital Product</h4>

                                
                                <div class="add-to-cart-wrapper">
                                    <p class="product-price">
                                        <ins><span class="amount">&pound;8.99</span></ins>
                                    </p>
                                    <p class="add-to-cart-button">
                                        <a href="index3a5b.html?add-to-cart=19" rel="nofollow" data-product_id="19" data-product_sku="" data-quantity="1" class="add_to_cart_button simple">Add to cart +</a>
                                    </p>
                                </div>

                               
                            </div>

                        </li>--%>
                    </ul>

                    <!-- END .sidebar-no-list-style -->
                </div>

                <!-- END .widget -->
            </section>




            <!-- END .sidebar-content -->
        </aside>

        <!-- END .content-wrapper -->
    </div>
</asp:Content>

