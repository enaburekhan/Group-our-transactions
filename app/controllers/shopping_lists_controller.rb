class ShoppingListsController < ApplicationController
  before_action :logged_in_user
  before_action :set_shopping_list, only: %i[show edit update destroy checkout]
  before_action :set_group, only: %i[group_shopping_lists]
  include ShoppingListsHelper

  def index
    @shopping_lists = current_user.shopping_lists_order_recent
  end

  def list_order_ancient
    @shopping_lists = current_user.shopping_lists_order_ancient
  end

  def list_external
    @shopping_lists = current_user.list_shopping_lists_join_groups
    @total = total_amount_on_external(@shopping_lists)
  end

  def group_shopping_lists
    @shopping_lists = @group.shopping_lists.where(active: true)
    @total = total_amount_on_external(@shopping_lists)
  end

  def show
    @shopping_list
  end

  def checkout
    @payment = Payment.new
  end

  def new
    @groups_added = []
    @shopping_list = ShoppingList.new
    @group = Group.all
  end

  def edit
    @group = Group.includes(:shopping_lists).all
  end

  def create
    @shopping_list = ShoppingList.new(shopping_list_params)
    @shopping_list.author_id = current_user.id
    @shopping_list.active = true
    @groups_ids = params[:shopping_list][:group_ids]

    if @shopping_list.save
      @groups_ids&.each do |prod|
        @shopping_list.groups << Group.find(prod)
      end
      redirect_to shopping_lists_path, notice: 'ShoppingList was successfully created.'
    elsif @shopping_list.errors[:amount].present?
      redirect_to new_shopping_list_url, notice: @shopping_list.errors[:amount].first
    else
      redirect_to new_shopping_list_url, notice: @shopping_list.errors[:name].first
    end
  end

  def update
    @groups_ids = params[:shopping_list][:group_ids]

    if @shopping_list.update(shopping_list_params)
      if !@groups_ids.nil?
        @groups_ids.each do |prod|
          @shopping_list.groups << Group.find(prod)
        end
      else
        ShoppingListsGroup.destroy_lst
      end
      redirect_to shopping_lists_path, notice: 'ShoppingList was successfully udpated.'
    elsif @shopping_list.errors[:amount].present?
      redirect_to edit_shopping_list_url, notice: @shopping_list.errors[:amount].first
    else
      redirect_to edit_shopping_list_url, notice: @shopping_list.errors[:name].first
    end
  end
end
