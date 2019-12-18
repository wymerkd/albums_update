require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('create an album path', {:type => :feature}) do
  it('creates an album and then goes to the album page') do
    visit('/albums')
    click_on('Add a New Album')
    fill_in('album_name', :with => 'Yellow Submarine')
    click_on('Go!')
    expect(page).to have_content('Yellow Submarine')
  end
end

#THIS SHIT IS BROKEN!
describe('create a song path', {:type => :feature}) do
  it('creates an album and then goes to the album page') do
    album = Album.new("Giant Steps", nil, "1943", "Reggae", "Bob Marley") #HW had 2 parameters but I added 3 to fix test error, still broken
    album.save
    visit("/albums/#{album.id}") #I think this is the wrong path
    save_and_open_page
    fill_in('song_name', :with => 'All You Need Is Love')
    click_on('Add song')
    expect(page).to have_content('All You Need Is Love')
  end
end
