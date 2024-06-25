﻿using AutoMapper;
using MovieBooker_backend.Models;
using MovieBooker_backend.Responses;

namespace MovieBooker_backend.Repositories.MovieImageRepository
{
	public class MovieImageRepository : IMovieImageRepository
	{
		private readonly bookMovieContext _context;
		private readonly IMapper _mapper;

		public MovieImageRepository(bookMovieContext context, IMapper mapper)
		{
			_context = context;
			_mapper = mapper;
		}

		public void deleteById(int id)
		{
			var existingImage = _context.MovieImages.FirstOrDefault(m => m.Id == id);
			if (existingImage == null) throw new Exception("Not found");
			_context.MovieImages.Remove(existingImage);
			_context.SaveChanges();
		}

		public List<MovieImageResponse> getAll()
		{
			var images = _context.MovieImages.ToList();
			return _mapper.Map<List<MovieImageResponse>>(images);
		}

		public List<MovieImageResponse> insert(List<MovieImageResponse> newImages)
		{
			foreach (var item in newImages)
			{
				var image = new MovieImage
				{
					Id = item.Id,
					LinkImage = item.LinkImage,
					MovieId = item.Id,
					Movie = _context.Movies.FirstOrDefault(m => m.MovieId == item.MovieId)
				};
				_context.MovieImages.Add(image);
				_context.SaveChanges();
			}
			return newImages;
		}

		public MovieImageResponse update(int id, MovieImageResponse updateImage)
		{
			var existingImage = _context.MovieImages.FirstOrDefault(m => m.Id == id);
			if (existingImage == null) throw new Exception("Not found");
			existingImage.LinkImage = updateImage.LinkImage;
			existingImage.MovieId = updateImage.MovieId;
			var movie = _context.Movies.FirstOrDefault(m => m.MovieId == updateImage.MovieId);
			if (movie == null) throw new Exception("Not found");
			existingImage.Movie = movie;
			_context.MovieImages.Update(existingImage);
			_context.SaveChanges();
			return updateImage;
		}
	}
}
