class NotesController < ApplicationController
  def index
    @show_notes = params[:show_notes] == "true"
    @show_archived_notes = params[:show_archived_notes] == "true"
    @show_deleted_notes = params[:show_deleted_notes] == "true"

    conditions = []
    conditions << { status: $valid_statuses[:active] } if @show_notes
    conditions << { status: $valid_statuses[:archived] } if @show_archived_notes
    conditions << { status: $valid_statuses[:deleted] } if @show_deleted_notes

    @notes = conditions.empty? ? Note.none : Note.where(conditions.reduce(:or))

  end

  def show
    @note = Note.find(params[:id])
  end

  def new
    @note = Note.new
    @users = User.all
  end

  def create
    @note = Note.new(note_params)
    if @note.save
      redirect_to @note
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @note = Note.find(params[:id])
  end

  def update
    @note = Note.find(params[:id])

    if @note.update(note_params)
      redirect_to @note
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def archive
    @note = Note.find(params[:id])
    if @note.update(status: $valid_statuses[:archived])
      redirect_to notes_path, notice: 'Note was successfully archived.'
    else
      render :edit
    end
  end

  def delete
    @note = Note.find(params[:id])
    if @note.update(status: $valid_statuses[:deleted])
      redirect_to notes_path, notice: 'Note was successfully deleted.'
    else
      render :edit
    end
  end

  private
  def note_params
    params.require(:note).permit(:title, :content, :user_id)
  end
end
