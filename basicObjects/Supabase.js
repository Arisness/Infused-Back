import { createClient } from '@supabase/supabase-js'; 
import { loadEnvFile } from 'process';
loadEnvFile('./config/.env');

const supabaseUrl = process.env.SUPABASE_URL;
const supabaseKey = process.env.SUPABASE_KEY;

const supabase = createClient(supabaseUrl, supabaseKey);

class SupabaseManager{
    async uploadImage(userName ,bufferImage, imageName){
        const { data, error } = await supabase.storage
            .from('infused')
            .upload(`users/${userName}/${imageName}`, bufferImage, {
                cacheControl: '3600',
                upsert: true
        });
        if (error) {
            console.log(error);
            logger.error(`Error uploading image: ${error.message}`);
        }
        const { data: publicUrlData } = supabase.storage
            .from('infused')
            .getPublicUrl(`users/${userName}/${imageName}`);

        return publicUrlData.publicUrl;
    }

    async deleteImage(url){
        try{
            const path = url
            .replace(/.*\/public\/infused\//, '')
            .replace(/.*\/infused\//, '');
            console.log(path);
            const { data, error } = await supabase.storage
                .from('infused')
                .remove([path]);
            if (error) {
                throw error;
            }
        }
        catch (error) {
            console.log(error.msg);
            logger.error(`Error deleting image: ${error.message}`);
        }
    }
}

const supabaseManager = new SupabaseManager();
export default supabaseManager;