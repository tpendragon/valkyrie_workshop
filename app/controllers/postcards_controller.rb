class PostcardsController < ApplicationController

  def new
    @change_set = PostcardChangeSet.new(Postcard.new)
    @others = metadata_adapter.query_service.find_all.to_a
    @change_set.prepopulate!
  end

  def create
    @change_set = PostcardChangeSet.new(Postcard.new)
    if @change_set.validate(params[:postcard])
      metadata_adapter.persister.save(resource: @change_set.sync)
      redirect_to @change_set.resource
    else
      render :edit
    end
  end

  def show
    redirect_to solr_document_path(id: params[:id])
  end

  def edit
    @change_set = PostcardChangeSet.new(find_resource(params[:id]))
    @others = metadata_adapter.query_service.find_all.to_a
    @change_set.prepopulate!
  end

  def update
    @change_set = PostcardChangeSet.new(find_resource(params[:id]))
    if @change_set.validate(params[:postcard])
      metadata_adapter.persister.save(resource: @change_set.sync)
      redirect_to @change_set.resource
    else
      render :edit
    end
  end

  def find_resource(id)
    metadata_adapter.query_service.find_by(id: Valkyrie::ID.new(id))
  end

  def metadata_adapter
    Valkyrie::MetadataAdapter.find(:solr)
  end
end
