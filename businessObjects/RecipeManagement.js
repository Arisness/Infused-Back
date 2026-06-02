export class RecipeManagement {
    async createRecipe(params){
        const data = params;
        try{
            if (data.image) data.image = await supabaseManager.uploadImage(data.user, data.image, `${data.user}_${data.name}_recipe_image.png`);
            const values = [
                data.name,
                data.description || null,
                data.image || null,
                data.userSession,
                data.ingredients,
                data.steps
            ];
            await runQuery([[queries.recipe.addRecipe, values]]);
            return 'Recipe created successfully';
        }
        catch (error){
            logger.error(`Error creating recipe: ${error}`);
            return 'Internal server error during recipe creation.';
        }
    }

    async deleteRecipe(data){
        try{
            const recipeData = await runQuery([[queries.recipe.getRecipe, [data.id]]]);
            if (recipeData.rows.length > 0 && recipeData.rows[0].recipe_image) {
                await supabaseManager.deleteImage(recipeData.rows[0].recipe_image);
            }
            await runQuery([[queries.recipe.deleteRecipe, [data.id, data.userSession]]]);
            return 'Recipe deleted successfully.';
        }
        catch (error){
            logger.error(`Error deleting recipe: ${error}`);
            return 'Internal server error during recipe deletion.';
        }
    }

    async updateRecipe(data){
        try{
            const options = ['name', 'description', 'image', 'ingredients', 'steps'];
            if (data.option == 2){
                if (data.value!=null) {
                    data.value = await supabaseManager.uploadImage(data.userSession, data.value, `${data.userSession}_profile_image.png`);
                } else {
                    const recipeData = await runQuery([[queries.recipe.getRecipe, [data.id]]]);
                    await supabaseManager.deleteImage(recipeData.rows[0].recipe_image);
                }
            }
            const query = queries.recipe.updateRecipe.replace('{{var}}', options[data.option]);
            await runQuery([[query, [data.value, data.id, data.userSession]]]);
            return 'Recipe updated successfully.';
        }
        catch (error){
            logger.error(`Error updating recipe: ${error}`);
            return 'Internal server error during recipe update.';
        }
    }

    async getAllRecipes(data){
        try{
            const recipesData = await runQuery([[queries.recipe.getAllRecipes, [data.userSession]]]);
            return recipesData.rows;
        }
        catch (error){
            logger.error(`Error fetching recipes: ${error}`);
            return 'Internal server error during fetching recipes.';
        }
    }
}